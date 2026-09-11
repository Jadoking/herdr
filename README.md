# Herdr config

Portable Herdr preferences and plugin settings. Runtime sessions, logs, sockets,
and Herdr-managed plugin checkouts are intentionally ignored.

## Set up a new machine

Install [Herdr](https://herdr.dev/docs/install/), then clone this repository:

```sh
git clone https://github.com/Jadoking/herdr.git \
  "${XDG_CONFIG_HOME:-$HOME/.config}/herdr"
```

Install Go 1.24 or newer; `herdr-auto-title` builds locally during installation.

Install the pinned plugins and the integrations used by this config:

```sh
./install-plugins.sh

for integration in pi claude codex opencode hermes; do
  herdr integration install "$integration"
done
```

Manage plugins by adding or updating pinned `herdr plugin install` commands in
`install-plugins.sh`, then rerun it. Do not commit `plugins.json` or
`plugins/github/`; HerdR generates and manages them for the current machine.
To remove one, run `herdr plugin uninstall <plugin-id>` and delete its install
line.

The `ctrl+h/j/k/l` bindings also require
[`vim-herdr-navigator`](https://github.com/AVGVSTVS96/vim-herdr-navigator).

Validate the result with:

```sh
herdr config check
vim-herdr-navigator doctor
```
