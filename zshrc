
# zplug
if [ ! -r "$HOME/.zplug/init.zsh" ]; then
    printf "Install zplug? [y/N]: "
    if read -rq; then
        echo; curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
    else
        exit
    fi
fi

# zplug init
source ~/.zplug/init.zsh

zplug "owenstranathan/pipenv.zsh"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search", 		defer:3
zplug "ael-code/zsh-colored-man-pages", from:"github"
zplug "b4b4r07/enhancd", 				use:"init.sh"

# Prezto
zplug "modules/history", 	from:"prezto"

# Tema
zplug "mafredri/zsh-async", from:"github"
zplug "sindresorhus/pure", 	from:"github", as:"theme", use:"pure.zsh", on:"mafredri/zsh-async"

# Commands
zplug "BurntSushi/ripgrep", as:"command", rename-to:"rg", 	from:"gh-r",	at:"0.10.0"
zplug "junegunn/fzf-bin", 	as:"command", rename-to:"fzf",	from:"gh-r" 	
zplug "stedolan/jq", 		as:"command", rename-to:"jq", 	from:"gh-r"
zplug "sharkdp/fd", 		as:"command", rename-to:"fd", 	from:"gh-r"

# Defer
zplug "zsh-users/zsh-autosuggestions", 		defer:2
zplug 'zdharma/fast-syntax-highlighting', 	defer:2

# install plugins which haven"t been installed yet
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -rq; then
      echo; zplug install
      chmod -R go-w ~/.zplug
  else
      echo
  fi
fi

# load zplug
zplug load --verbose

# -*- mode: shell -*-
# vi: set ft=shell :