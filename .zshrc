#zmodload zsh/zprof

# Install and load zplugin
function load_zplugin()
{
    source "${HOME}/.zplugin/bin/zplugin.zsh"
    
    # Carregar automaticamente o comando usado pelo plugin
    autoload -Uz add-zsh-hook \
        cdr \
        chpwd_recent_dirs \
        compinit \
        _zplugin

    (( ${+_comps} )) && _comps[zplugin]=_zplugin
}

if [ ! -d "${HOME}/.zplugin" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
    chmod -R 755 ${HOME}/.zplugin
    load_zplugin
    zplugin self-update
else
    load_zplugin
fi

# ===== zplugin > Utilities =====

# zsh
zplugin snippet 'OMZ::lib/completion.zsh'
zplugin snippet 'OMZ::lib/compfix.zsh'

# ===== zplugin > Plugins =====

# alias-tips
export ZSH_PLUGINS_ALIAS_TIPS_TEXT='alias-tips: '
zplugin light 'djui/alias-tips'

# z
zplugin light 'skywind3000/z.lua'

# Se houver um arquivo .env no diretório de trabalho, ele será carregado automaticamente.
zplugin snippet 'OMZ::plugins/dotenv/dotenv.plugin.zsh'

# Este é um plugin que define a ligação de chave para retornar ao processo suspenso pelo controle-Z do estado de espera de entrada do comando.
zplugin snippet 'OMZ::plugins/fancy-ctrl-z/fancy-ctrl-z.plugin.zsh'

# É um plugin que define o complemento do Git e um grande número de aliases.
zplugin snippet 'OMZ::plugins/git/git.plugin.zsh'

# git flow
zplugin snippet 'OMZ::plugins/git-flow/git-flow.plugin.zsh'

# zsh_reload
zplugin snippet 'OMZ::plugins/zsh_reload/zsh_reload.plugin.zsh'
# }}}

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

# enhancd
zplugin ice pick"init.sh"; zplugin light 'b4b4r07/enhancd'

# zsh-history-substring-search
zplugin light zsh-users/zsh-history-substring-search

# Load the pure theme, with zsh-async library that's bundled with it
zplugin ice pick"async.zsh" src"pure.zsh"; zplugin light sindresorhus/pure

# fzf
zplugin ice from"gh-r" as"program"; zplugin load junegunn/fzf-bin

# forgit
zplugin light wfxr/forgit

# ripgrep
zplugin ice from"gh-r" as"program" bpick"*64*linux*" mv"ripgrep* -> ripgrep" pick"ripgrep/rg"; zplugin light BurntSushi/ripgrep

# jq
zplugin ice from"gh-r" as"program" bpick"*linux64" mv"jq-linux64 -> jq"; zplugin light stedolan/jq

#fd
zplugin ice from"gh-r" as"program" mv"fd* -> fd" pick"fd/fd"; zplugin light sharkdp/fd

#bat
zplugin ice from"gh-r" as"program" bpick"*x86_64*linux*musl*" pick"*bat*/bat"; zplugin light sharkdp/bat

#lazydocker
zplugin ice from"gh-r" as"program" bpick"*Linux_x86_64*" pick"*lazydocker*/lazydocker"; zplugin light jesseduffield/lazydocker

#pup
zplugin ice from"gh-r" as"program" bpick"*linux_amd64*"; zplugin light ericchiang/pup

# exa
zplugin ice from"gh-r" as"program" bpick"*linux*" mv"*exa* -> exa"; zplugin light ogham/exa

#fselect - Find files with SQL-like queries
zplugin ice from"gh-r" as"program" bpick"*x86_64*linux*musl*" mv"fselect-* -> fselect"; zplugin light jhspetersson/fselect

# jq-zsh-plugin
zplugin light reegnz/jq-zsh-plugin

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

# zsh-autosuggestions
zplugin ice lucid wait"0" atload"_zsh_autosuggest_start"; zplugin light zsh-users/zsh-autosuggestions

# zsh-completions
zplugin ice lucid wait"0" blockf; zplugin light zsh-users/zsh-completions

# fast-syntax-highlighting
zplugin ice lucid wait"5" atinit"zpcompinit; zpcdreplay"; zplugin light zdharma/fast-syntax-highlighting

#zprof

function chpwd() {
  if [[ -z ${VIRTUAL_ENV+x} ]]; then
    if [[ -s "Pipfile" ]]; then
      pipenv shell
    elif [[ -d ".venv" ]]; then
    fi
  fi
}

for f in ~/.zsh/[0-9]*.(sh|zsh)
do
  source "$f"
done

# load local configurations
[[ -e ~/.local.sh ]] && source ~/.local.sh
