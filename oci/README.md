# Container Tool

## Docker

- `docker-compose build`
- `docker-compose up -d`

## Rootless Podman

- `podman-compose build`
- `podman-compose up -d`
- `systemctl --user enable podman-restart.service`
- `sudo loginctl enable-linger $USER`
