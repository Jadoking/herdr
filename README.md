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

On Linux with systemd, start the default Herdr session automatically:

```sh
mkdir -p ~/.config/systemd/user
ln -sf ~/.config/herdr/systemd/herdr.service ~/.config/systemd/user/herdr.service
systemctl --user daemon-reload
systemctl --user enable herdr.service
```

Enable user lingering if the server should start at boot before login:

```sh
loginctl enable-linger "$USER"
```

Manage plugins by adding or updating pinned `herdr plugin install` commands in
`install-plugins.sh`, then rerun it. Do not commit `plugins.json` or
`plugins/github/`; HerdR generates and manages them for the current machine.
To remove one, run `herdr plugin uninstall <plugin-id>` and delete its install
line.

## Pet

`herdr-pet` is pinned in `install-plugins.sh`; its portable settings select
Dewey. Pet artwork stays outside this repository. On a new machine, fetch the
personal-use asset from Codex's CDN:

```sh
mkdir -p ~/.codex/pets/dewey
curl -fL -o ~/.codex/pets/dewey/spritesheet.webp \
  https://persistent.oaistatic.com/codex/pets/v1/dewey-spritesheet-v4.webp
printf '{"id":"dewey"}\n' > ~/.codex/pets/dewey/pet.json
herdr-pet use dewey
herdr server reload-config
```

Use a Kitty-graphics-capable terminal such as Ghostty, kitty, or WezTerm.
Detach and reattach existing clients if the pet does not appear after enabling
`experimental.kitty_graphics`.

- `prefix+shift+p`: show or hide the pet.
- `prefix+shift+o`: pet settings and selection.
- `herdr-pet status`: daemon, selected pet, and log location.
- On macOS, control-option-drag moves it. Grant the terminal Accessibility
  permission if prompted; other plugin functionality does not require dragging.

The `ctrl+h/j/k/l` bindings also require
[`vim-herdr-navigator`](https://github.com/AVGVSTVS96/vim-herdr-navigator).

Validate the result with:

```sh
herdr config check
vim-herdr-navigator doctor
```
