# Herdr config

Portable Herdr preferences and plugin settings. Runtime sessions, logs, sockets,
and Herdr-managed plugin checkouts are intentionally ignored.

## Set up a new machine

Install [Herdr](https://herdr.dev/docs/install/), then clone this repository:

```sh
git clone <repository-url> "${XDG_CONFIG_HOME:-$HOME/.config}/herdr"
```

Reinstall the pinned workflow plugin and the integrations used by this config:

```sh
herdr plugin install ntindle/herdr-resurrect \
  --ref 5afa6755d4f35c62c7522ba4fd04922d1ac69602 --yes

for integration in pi claude codex opencode hermes; do
  herdr integration install "$integration"
done
```

The `ctrl+h/j/k/l` bindings also require
[`vim-herdr-navigator`](https://github.com/AVGVSTVS96/vim-herdr-navigator).

Validate the result with:

```sh
herdr config check
vim-herdr-navigator doctor
```
