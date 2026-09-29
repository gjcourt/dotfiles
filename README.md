# dotfiles

Personal shell, editor, and window-manager configuration, plus a script to
symlink it all into `$HOME`.

## Contents

| File | Purpose |
| --- | --- |
| `.profile` | Bash prompt (branch-aware, colored), `PATH`, `EDITOR`, aliases, and git completion. Sources `~/.profile.local` if present. |
| `.bashrc_local` | A smaller set of aliases and exports (editor, `ls`/`grep` aliases, Python bytecode setting), meant to be sourced from a machine's own `~/.bashrc`. |
| `.vimrc` | Vim settings: line numbers, search behavior, tabs/whitespace, NERDTree and other plugin config. |
| `.gvimrc` | GUI Vim additions, mostly MacVim key bindings (Command-T, fullscreen, tab switching). |
| `.tmux.conf` | tmux config: `C-a` prefix, vi-style keys and copy mode, custom status bar, 100k line scrollback. |
| `.slate` | Window-management bindings for the Slate window manager on macOS. |
| `settings.jar` | Exported JetBrains IDE settings (PyCharm/IntelliJ): color scheme, code style, file templates. Imported manually through the IDE's settings import, not symlinked by `bootstrap.sh`. |
| `bootstrap.sh` | Symlinks every dotfile above into `$HOME`. |

## Install

`bootstrap.sh` lists every entry in the repo root that starts with `.`
(excluding `.git`) and symlinks it to the same name under `$HOME`:

```sh
./bootstrap.sh
```

It doesn't back up or remove existing files first, so move aside anything
already at `~/.profile`, `~/.vimrc`, etc. before running it. Files without a
leading dot, such as `settings.jar`, are left alone and are not symlinked.

To pull in machine-specific settings without editing tracked files, add a
`~/.profile.local` — `.profile` sources it automatically if it exists.
