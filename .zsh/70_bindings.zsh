#!/usr/bin/env zsh

bindkey '\e[1~'     beginning-of-line
bindkey '\e[H'      beginning-of-line
bindkey '\eOH'      beginning-of-line

bindkey '\e[4~'     end-of-line
bindkey '\e[F'      end-of-line
bindkey '\eOF'      end-of-line

bindkey '\e[3~'     delete-char
bindkey '^[[3~'     delete-char

bindkey '^?'        backward-delete-char

bindkey '\e[1;5D'   backward-word
bindkey '\e[5D'     backward-word
bindkey '\e\e[D'    backward-word
bindkey '^[^[[D'    backward-word
bindkey '^[[1;5D'   backward-word
bindkey '^[[1;3D'   backward-word
bindkey '^[[5D'     backward-word

bindkey '\e[1;5C'   forward-word
bindkey '\e[5C'     forward-word
bindkey '\e\e[C'    forward-word
bindkey '^[^[[C'    forward-word
bindkey '^[[1;5C'   forward-word
bindkey '^[[1;3C'   forward-word
bindkey '^[[5C'     forward-word

bindkey '^[[A'      history-substring-search-up
bindkey '\eOA'      history-substring-search-up
bindkey '^[[B'      history-substring-search-down
bindkey '\eOB'      history-substring-search-down