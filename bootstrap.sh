#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function dotfiles {
    ls -a "$DOTFILES_DIR" | grep -vE "^\.{1,2}$" | grep -E "^\." | grep -vE '^\.git$'
}

for file in $(dotfiles); do
    # -n prevents ln from dereferencing an existing directory symlink
    ln -sfn "$DOTFILES_DIR/$file" "$HOME/$file"
done
