<!-- readme-type: infra -->
# dotfiles

Personal shell, editor, and window-manager configuration, symlinked into $HOME

Setting up a new machine means recreating a shell prompt, editor settings,
tmux behavior, and window-management bindings by hand. This repo tracks that
configuration in one place, and `bootstrap.sh` symlinks it into `$HOME` in one
step. It also carries an exported JetBrains IDE settings bundle for manual
import.

**Status:** unmaintained since 2018-08 — no configuration changes since then,
only this README.

## Layout

```text
.profile        bash prompt (branch-aware, colored), PATH, EDITOR, aliases, git completion
.bashrc_local   smaller set of aliases/exports, meant to be sourced from a machine's own ~/.bashrc
.vimrc          vim settings: line numbers, search, tabs/whitespace, NERDTree and other plugins
.gvimrc         GUI vim additions, mostly MacVim key bindings
.viminfo        vim's persistent state (search/command history, registers, marks), tracked and symlinked like the rest
.tmux.conf      tmux config: C-a prefix, vi-style keys and copy mode, custom status bar, 100k line scrollback
.slate          window-management bindings for the Slate window manager (macOS)
settings.jar    exported JetBrains IDE settings; imported manually through the IDE, not symlinked
bootstrap.sh    symlinks every dotfile above into $HOME
```

`~/.profile.local`, if present, is sourced automatically by `.profile` for
machine-specific settings that don't belong in a tracked file.

## Making a change

1. Branch from `master`.
2. Validate locally (`bash -n bootstrap.sh`).
3. Open a PR. There's no CI and nothing deploys automatically; merging just
   updates `master`, and changes take effect on a machine the next time you
   run `bootstrap.sh` there.

## Development

```bash
bash -n bootstrap.sh
```

There's no other build, test, or lint step in this repo.

## License

No licence file yet.
