# spotlight-apps

Tiny shell scripts that become tiny apps that do tiny things.

## Apps

- Lock
- Screen saver

## Install
```sh
git clone git@github.com:d3v1an7/spotlight-apps.git
cd spotlight-apps
make

# Homebrew coming soon...
```

## Build

```sh
make
```

## Adding new apps

1. Write bash script (and .cfg), pop them in `include/`
1. Get a 1024x1024 icon (optional)
  - Current icons are sourced from [Material Design](https://material.io/tools/icons/?style=outline)
  - The SVG is converted to 1024px png with white fill manually
1. Grab `brew cask install image2icon` (optional)
1. Export to ICNS file, and drop it in `icon/` (optional)
1. Run `make`
1. If everything works, add app details to `README.md` and submit PR!
