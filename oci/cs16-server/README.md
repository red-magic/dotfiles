# Counter-Strike 1.6 Dedicated Server Container

## Docker

- `./manage-container build`
- `./manage-container deploy`

## Rootless Podman

- `./manage-container build`
- `./manage-container deploy`
- `systemctl --user enable podman-restart.service`
- `sudo loginctl enable-linger $USER`
