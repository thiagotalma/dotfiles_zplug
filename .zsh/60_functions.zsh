#!/usr/bin/env zsh

# ターミナルのタブにディレクトリ名を表示
function precmd() {
  local wname=`pwd | sed -e "s|$HOME|~|"` # カレントディレクトリを $HOME を ~ として表示
  local tname=`pwd | sed -e 's|^.*/||'`   # カレントディレクトリ名
  echo -ne "\033]2;$wname\007"            # window title
  echo -ne "\033]1;$tname\007"            # tab title
}

function ghq-fzf() {
  local selected_dir=$(ghq list | fzf --query="$LBUFFER")

  if [ -n "$selected_dir" ]; then
    BUFFER="cd $(ghq root)/${selected_dir}"
    zle accept-line
  fi

  zle reset-prompt
}

zle -N ghq-fzf
bindkey "^]" ghq-fzf 
