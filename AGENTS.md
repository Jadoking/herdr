# Repository instructions

## Plugins

`install-plugins.sh` is the source of truth for installed HerdR plugins.

- Add a plugin with a separate `herdr plugin install` command pinned to an exact
  commit SHA. Review its manifest and executable code before using `--yes`.
- Update a plugin by changing its pinned SHA and rerunning the script.
- Remove a plugin with `herdr plugin uninstall <plugin-id>`, then delete its
  install command.
- Track portable, non-secret user settings under `plugins/config/<plugin-id>/`.
- Leave `plugins.json`, `.plugins.lock`, and `plugins/github/` untracked; HerdR
  generates them with machine-specific paths and runtime metadata.

After a plugin change, run:

```sh
sh -n install-plugins.sh
herdr config check
herdr plugin list
```

The change is complete when the script is valid, the config passes, and the
plugin list shows every pinned plugin at its intended revision.
