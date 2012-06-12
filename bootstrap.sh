#!/bin/sh

function dotfiles() {
    ls -a | egrep -v "^\.{1,2}$" | grep -e "^\."
}

for file in `dotfiles`
do
    ln -s `pwd`/$file ~/
done
