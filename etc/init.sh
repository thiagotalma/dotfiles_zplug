#!/bin/bash

DOT_DIRECTORY="${HOME}/.dotfiles"


# Zsh
[ "${SHELL}" != "$(which zsh)"  ] && chsh -s $(which zsh)
echo "$(tput setaf 2)Initialize complete!. ✔︎$(tput sgr0)"

# zplugin
[ ! -d ${HOME}/.zplugin ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"

