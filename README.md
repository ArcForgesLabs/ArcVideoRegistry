# ArcVideo Registry

vcpkg overlay ports for ArcVideo private dependencies.

## Usage

```bash
# Clone this registry
git clone https://github.com/ArcForgesLabs/ArcVideoRegistry.git build/vcpkg_registry

# Install with overlay
vcpkg install arcvideo-foundation --overlay-ports=build/vcpkg_registry/ports
```

## Ports

| Port | Version | Description |
|------|---------|-------------|
| `arcvideo-foundation` | 1.0.0 | Core library — rational math, timecodes, color, audio params |

## Automation

The `arcvideo-foundation` port hash is automatically updated by a GitHub Actions
workflow in the [ArcVideoFoundation](https://github.com/ArcForgesLabs/ArcVideoFoundation)
repository whenever a new commit is pushed to `main`.
