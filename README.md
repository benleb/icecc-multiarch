# icecc-multiarch

## run

```bash
# arm64
docker run --rm --platform linux/arm64 --net host ghcr.io/benleb/icecc-multiarch:latest -v

# amd64
docker run --rm --platform linux/amd64 --net host ghcr.io/benleb/icecc-multiarch:latest -v

# arm/v7
docker run --rm --platform linux/arm/v7 --net host ghcr.io/benleb/icecc-multiarch:latest -v

# arm/v6
docker run --rm --platform linux/arm/v7 --net host ghcr.io/benleb/icecc-multiarch:latest -v
```

See [workflow](.github/workflows/build.yml) for available `--platform`s

## local build

```bash
docker buildx build --file icecc.Dockerfile --tag icecc-multiarch:dev --platform linux/arm64,linux/amd64 --load .
```
