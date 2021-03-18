# icecc-multiarch

## run

```bash
# arm64
docker run --rm --platform linux/arm64 --net host ghcr.io/benleb/icecc-multiarch:latest -vv

# amd64
docker run --rm --platform linux/amd64 --net host ghcr.io/benleb/icecc-multiarch:latest -vv

# arm/v7
docker run --rm --platform linux/arm/v7 --net host ghcr.io/benleb/icecc-multiarch:latest -vv

# arm/v6
docker run --rm --platform linux/arm/v6 --net host ghcr.io/benleb/icecc-multiarch:latest -vv
```

See [workflow](.github/workflows/build.yml) for available `--platform`s

## compose example

```yaml
  ...

  icecc-arm64:
    image: ghcr.io/benleb/icecc-multiarch
    container_name: "icecc-arm64"
    platform: "linux/arm64"
    network_mode: host
    restart: unless-stopped

  icecc-armv6:
    image: ghcr.io/benleb/icecc-multiarch
    container_name: "icecc-armv6"
    platform: "llinux/arm/v6"
    network_mode: host
    restart: unless-stopped

  ...
```


## local build

```bash
# native arch
docker buildx build ---tag icecc-multiarch:dev --load .

# given arch(s)
docker buildx build ---tag icecc-multiarch:dev --platform linux/arm64,linux/amd64 --load .
```
