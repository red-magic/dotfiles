# Encrypted gentoo install with btrfs on AMD Ryzen

1. [Disk preparation](#disk-preparation)
2. [Stage 3](#stage-3)
3. [make.conf editing](#makeconf-editing)
4. [Configuring the system](#configuring-the-system)
5. [Kernel editing](#kernel-editing)
6. [Compiling kernel](#compiling-kernel)
7. [Grub](#grub)
8. [Network](#network)
9. [Other](#other)
10. [Reboot](#reboot)
11. [Zram swap](#zram-swap)


You can use any live iso to install gentoo, I suggest to use archlinux.iso since it has a script for
generating fstab file.

## Disk preparation
Make a GPT table and create */dev/sda1* whith 64MB, then */dev/sda2* with all the free space left.
Swap will be created later with zram block device, no partitiion needed for it.

| partition     | size            | file system |
| ------------- | -------------   | ----------- |
| `/boot/efi`   | 64Mb            | fat32
| `/`           | all free space  | btrfs

```
cfdisk /dev/sda
```
Create a luks partition
```
cryptsetup -v -c aes-xts-plain64 -s 512 -h sha512 /dev/sda2
cryptsetup luksOpen /dev/sda2 root
```
Format root
```
mkfs.btrfs /dev/mapper/root
```
Format */dev/sda1* which will be used for */boot/efi*
```
mkfs.fat -F32 /dev/sda1
```
Mount root
```
mount -o compress-force=lzo,autodefrag /dev/mapper/root /mnt/gentoo
cd /mnt/gentoo
```

## Stage 3

Download and extract *amd64 iso*
```
links https://www.gentoo.org/downloads/
tar xvpf *.tar.xz --xattrs-unclude='*.*' --numeric-owner
```
Copy *resolv.conf* and *repos.conf*
```
mkdir /mnt/gentoo/etc/portage/repos.conf
cp /mnt/gentoo/usr/share/portage/config/repos.conf /mnt/gentoo/etc/portage/repos.conf/gentoo.conf
cp /etc/resolv.conf /mnt/gentoo/etc/resolv.conf
```
Mount filesystems
```
mount -t proc /proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
```

Generate fstab file
```
genfstab -U /mnt >> /mnt/etc/fstab
```

Chroot into */mnt/gentoo* and mount */boot/efi* partition
```
chroot /mnt/gentoo /bin/bash
source /etc/profile
export PS1="(chroot) $PS1"
mount /dev/sda1 /boot/efi
emerge-webrsync
```

Set hwclock to local
```
nano /etc/conf.d/hwclock
```
```
clock="local"
```
Set timezone
```
ln -sfv /usr/share/zoneinfo/Region/City /etc/localtime
```

## make.conf editing
```
nano /etc/portage/make.conf
```
Example of *make.conf*
```
COMMON_FLAGS="-march=znver1 -O3 -pipe"
MAKEOPTS="-j9"
INPUT_DEVICES="libinput keyboard mouse"
VIDEO_CARDS="amdgpu radeonsi"
GRUB_PLATFORMS="efi-64"
ACCEPT_KEYWORDS="~amd64"
LLVM_TARGETS="AMDGPU"
CPU_FLAGS_X86="aes avx avx2 f16c fma3 mmx mmxext pclmul popcnt sse sse2 sse3 sse4_1 sse4_2 sse4a ssse3"
USE="aes avx avx2 f16c fma3 mmx mmxext pclmul popcnt sse sse2 sse3 sse4_1 sse4_2 sse4a ssse3"
GENTOO_MIRRORS="http://mirror.yandex.ru/gentoo-distfiles/ ftp://mirror.yandex.ru/gentoo-distfiles/"
```
Note that I included
```
ACCEPT_KEYWORDS="~amd64"
```
All packages will be updated to the latest testing version instead of the stable

## Configuring the system

Set your profile
```
eselect profile list
eselect profile set X
```

Set locale
```
nano /etc/locale.gen
locale-gen
eselect locale list
eselect locale set X
```

And then
```
env-update && source /etc/profile
export PS1="(chroot) $PS1"
```

Emerge all required packages
```
emerge -av gentoo-sources linux-firmware btrfs-progs
```

## Kernel editing

Steal config file from here
```
https://git.archlinux.org/svntogit/packages.git/plain/trunk/config?h=packages/linux
```
And put it in /usr/src/linux/.config

```
cd /usr/src/linux
make nconfig
```

**All of these must be built in kernel**

Include microcode for you processor and amdgpu firmware

Find more info here:
```
https://wiki.gentoo.org/wiki/Ryzen
https://wiki.gentoo.org/wiki/AMDGPU
```
```
Processor type and features  --->
    <*> CPU microcode loading support
    [*]   AMD microcode loading support
```
```
Device Drivers  --->
    Generic Driver Options  --->
        [*] Include in-kernel firmware blobs in kernel binary
	    (amd-ucode/your_cpu_family.bin amdgpu/your_gpu_blobs.bin) External firmware blobs to build into the kernel binary
	    (/lib/firmware) Firmware blobs root directory
```

Enable device mapper support
```
[*] Multiple devices driver support (RAID and LVM) --->
    <*> Device mapper support
    <*> Crypt target support
```
Enable btrfs support
```
File Systems --->
    <*> Btrfs
```
Crypto
```
[*] Cryptographic API --->
    <*> XTS support
    <*> SHA224 and SHA256 digest algorithm
    <*> SHA384 and SHA512 digest algorithms
    <*> AES cipher algorithm
    <*> AES-NI
    <*> LZO compression
    <*> User-space interface for hash algorithms
    <*> User-space interface for symmetric key cipher algorithms
```

## Compiling kernel
First add support for lzma initramfs compression and cryptsetup binary
Create */etc/portage/package.use/zz-autounmask* and add
```
sys-apps/kmod lzma
sys-kernel/genkernel cryptsetup
```
Emerge these
```
emerge -av genkernel cryptsetup
emerge -av1 kmod
```

Compile and install kernel and modules
```
make -j9 && make install && make modules_install
```

In order to avoid entering password twice during boot there should be a luks key in initramfs. Create a folder for the key
```
/etc/key/mnt/key
```
Now generate a key and add it to the luks header
```
dd if=/dev/random of=/etc/key/mnt/key/key bs=512 count=4
cryptsetup addLuksKey /dev/sda2 /etc/key/mnt/key/key
```
To include the key in initramfs you need to edit */etc/genkernel.conf*
Find this line and add
```
INITRAMFS_OVERLAY="/etc/key"
```
genkernel --luks --btrfs --loglevel=3 initramfs

## Grub

Edit */etc/portage/package.use/zz-autounmask* file and add the following lines
```
sys-boot/grub device-mapper
```
```
emerge -av grub efibootmgr
```
Add UUID of the luks partition */dev/sda2* to grub
```
blkid | grep sda2 | awk '{print $2}' >> /etc/default/grub
nano -w /etc/default/grub
```
```
GRUB_CMDLINE_LINUX="crypt_root=UUID=6a7a642a-3262-4f87-9540-bcd53969343b root=/dev/mapper/root root_key=key root_keydev=/dev/ram0"
GRUB_GFXMODE=1920x1080x32
GRUB_ENABLE_CRYPTODISK=y
```
Install grub and generate *grub.cfg*
```
grub-install --target=x86_64-efi --boot-directory=/boot --efi-directory=/boot/efi --bootloader-id=Gentoo
grub-mkconfig -o /boot/grub/grub.cfg
```

## Network

```
emerge --ask net-misc/dhcpcd
```

## Other
Set root password
```
passwd
```
Add a user
```
useradd -m -G wheel,users,usb,video,audio -s /bin/bash username
passwd username
```

## Reboot
```
exit
umount -R /mnt/gentoo
cryptsetup close root
reboot
```

## Zram swap
Using zram-init script for swap, make sure you have the ```Compressed RAM block device support``` module enabled in your kernel
You can change the size of swap file in */etc/conf.d/zram-init* file
```
emerge -av zram-init
rc-update zram-init default
```
