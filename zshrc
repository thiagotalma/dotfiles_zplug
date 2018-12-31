#zmodload zsh/zprof

# Install and load zplugin
function load_zplugin()
{
    source "${HOME}/.zplugin/bin/zplugin.zsh"
    # autoload -Uz _zplugin
    # (( ${+_comps} )) && _comps[zplugin]=_zplugin
}

if [ ! -d "${HOME}/.zplugin" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
    load_zplugin
    zplugin self-update
else
    load_zplugin
fi


# autoload -Uz compinit
# typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
# if [ "$(date +'%j')" != "$updated_at" ]; then
#     echo "SEM CACHE"
#   compinit -i
# else
#     echo "COOM CACHE"
#   compinit -C -i
# fi

# zplugin light zdharma/fast-syntax-highlighting



# # Install and load zplugin
# function load_zplugin()
# {
#     source "${HOME}/.zplugin/bin/zplugin.zsh"
#     autoload -Uz _zplugin
#     (( ${+_comps} )) && _comps[zplugin]=_zplugin
# }

# if [ ! -d "${HOME}/.zplugin" ]; then
#     sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
#     load_zplugin
#     zplugin self-update
# else
#     load_zplugin
# fi

zplugin snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
zplugin snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh

# prezto
zplugin snippet PZT::modules/history/init.zsh
zplugin snippet PZT::modules/directory/init.zsh
zplugin snippet PZT::modules/completion/init.zsh
zstyle ':prezto:module:utility:ls' color 'yes'
zplugin snippet PZT::modules/utility/init.zsh

# zplugin light chrissicool/zsh-256color
# zplugin light djui/alias-tips

# Load the pure theme, with zsh-async library that's bundled with it
zplugin ice pick"async.zsh" src"pure.zsh"; zplugin light sindresorhus/pure

# fzf
zplugin ice from"gh-r" as"program"; zplugin load junegunn/fzf-bin

# ripgrep
zplugin ice from"gh-r" as"program" bpick"*64*linux*" mv"ripgrep* -> ripgrep" pick"ripgrep/rg"; zplugin light BurntSushi/ripgrep

# jq
zplugin ice from"gh-r" as"program" bpick"*linux64" mv"jq-linux64 -> jq"; zplugin light stedolan/jq

#fd
zplugin ice from"gh-r" as"program" pick"fd/fd" mv"fd* -> fd"; zplugin light sharkdp/fd

# fzf
if (( $+commands[fzf] )); then
  zplugin ice wait"0" lucid multisrc"shell/{key-bindings,completion}.zsh" pick""
  zplugin light junegunn/fzf
  if (( $+commands[fd] )); then
    export FZF_DEFAULT_COMMAND="fd . ."
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="fd -t d . ."
  fi
  #bindkey '\eOA' fzf-history-widget
  #bindkey '\eOB' fzf-history-widget
fi

# zsh-completions
zplugin ice lucid wait"0" blockf; zplugin light zsh-users/zsh-completions

# zsh-autosuggestions
zplugin ice lucid wait"0" atload"_zsh_autosuggest_start"; zplugin light zsh-users/zsh-autosuggestions

# fast-syntax-highlighting
zplugin ice lucid wait"0" atinit"zpcompinit; zpcdreplay"; zplugin light zdharma/fast-syntax-highlighting

zplugin ice lucid wait"5"; zplugin light zsh-users/zsh-history-substring-search


#zprof
