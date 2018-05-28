# spotlight-apps

Tiny shell scripts that become tiny apps that do tiny things.

If you're like me and don't use Alfred anymore, but miss being able to type simple system commands into Spotlight like:
- Lock
- Screen saver

Then this might be a good fit for you!

## Install

```sh
brew cask install d3v1an7/homebrew-custom/spotlight-apps
```

## Build

```sh
git clone git@github.com:d3v1an7/spotlight-apps.git
cd spotlight-apps
make
```

## Adding new apps

- Write bash script (and .cfg), pop them in `include/`
- Get a 1024x1024 icon (optional)
  - Current icons are sourced from [Material Design](https://material.io/tools/icons/?style=outline)
  - The SVG is converted to 1024px png with white fill manually
- Grab `brew cask install image2icon` (optional)
- Export to ICNS file, and drop it in `icon/` (optional)
- Run `make`
- If everything works, send me a PR!
