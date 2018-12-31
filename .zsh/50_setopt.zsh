#!/usr/bin/env zsh

bindkey -e

setopt no_beep                                              # ビープ音を鳴らさない
setopt nolistbeep                                           # 補完候補表示時にビープ音を鳴らさない
setopt auto_cd                                              # `cd`不要で移動する
setopt auto_pushd                                           # cd -<tab>で以前移動したディレクトリを表示
setopt pushd_ignore_dups                                    # auto_pushdで重複するディレクトリは記録しない
setopt correct                                              # コマンドのスペルミスを指摘する
setopt magic_equal_subst                                    # コマンドラインの引数でも補完を有効にする
setopt prompt_subst                                         # PROMPT変数内で変数参照する
setopt notify
setopt equals

zstyle ':completion:*' use-cache true　                     # apt-getとかdpkgコマンドをキャッシュを使って速くする

### Complement ###
autoload -U compinit; compinit
setopt auto_list                                            # 補完候補を一覧で表示する(d)
setopt auto_menu                                            # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed                                          # 補完キー連打で順に補完候補を自動で補完
setopt list_types                                           # 補完候補一覧でファイルの種別を識別マーク表示 (訳注:ls -F の記号)
setopt auto_param_keys                                      # カッコの対応などを自動的に補完
setopt auto_param_slash                                     # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt mark_dirs                                            # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加

bindkey "^[[Z" reverse-menu-complete                        # Shift-Tabで補完候補を逆順する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'         # 小文字と大文字を区別しない

### Glob ###
setopt extended_glob                                        # 拡張グロブで補完(~とか^とか。例えばless *.txt~memo.txt ならmemo.txt 以外の *.txt にマッチ)
unsetopt caseglob

### History ###
setopt bang_hist                                            # !を使ったヒストリ展開を行う(d)
setopt extended_history                                     # 履歴ファイルにzsh の開始・終了時刻を記録する
setopt hist_ignore_dups                                     # 重複するコマンドは古い方を削除する
setopt share_history                                        # 履歴を複数の端末で共有する
setopt hist_reduce_blanks                                   # 余分なスペースを削除してヒストリに記録する

# 履歴検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
function history-all { history -E 1 }

# 補完に使うソース
zstyle ':completion:*' completer _complete _expand _list _match _prefix _approximate

# Enable cache
zstyle ':completion::complete:*' use_cache 1

# スマートケースで補完
zstyle ':completion:*' matcher-list ' 'm:{a-z}={A-Z}' 'm:{A-Z}={a-z}''

# ls
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"

# cd
zstyle ':completion:*:cd:*' tag-order local-directories path-directories

# kill
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'

# Select like Emacs
zstyle ':completion:*:default' menu select=1

# sudo を含めても保管できるようにする
zstyle ':completion:*:sudo:*' command-path $sudo_path $path

# Verbose
zstyle ':completion:*' verbose yes

# hub補完
[[ -f $HOME/.bash_completion/hub.bash_completion.sh ]] && . $HOME/.bash_completion/hub.bash_completion.sh
