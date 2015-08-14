#!/bin/bash
function dotfiles {
    ls -a | grep -vE "^\.{1,2}$" | grep -E "^\." | grep -vE '^.git$'
}
for file in `dotfiles`
do
    ln -s `pwd`/$file ~/
done
