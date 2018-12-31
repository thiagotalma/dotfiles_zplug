#!/usr/bin/env zsh

# override
alias vim='nvim'
alias ls="ls -AFG" # カラー表示

# common-aliases
alias ll='ls -ltr'
alias zshrc='$EDITOR ~/.zshrc'
alias t='tail -f'
alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='bfs . -type d -name'
alias ff='bfs . -type f -name'
alias h='history'
alias help='man'
alias p='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'
alias relogin='exec $SHELL -l'

# directories
alias u='builtin cd ..'
alias md='mkdir -p'
alias rd='rmdir'

# brew
alias brews='brew list -1'
alias bubo='brew update && brew outdated'
alias bubc='brew upgrade && brew cleanup'
alias bubu='bubo && bubc'

# bundler
alias be='bundle exec'
alias bl='bundle list'
alias bp='bundle package'
alias bo='bundle open'
alias bout='bundle outdated'
alias bu='bundle update'
alias bi='bundle_install'
alias bcn='bundle clean'

# docker-compose
alias dco='docker-compose'
alias dcb='docker-compose build'
alias dce='docker-compose exec'
alias dcps='docker-compose ps'
alias dcrestart='docker-compose restart'
alias dcrm='docker-compose rm'
alias dcr='docker-compose run'
alias dcstop='docker-compose stop'
alias dcup='docker-compose up'
alias dcdn='docker-compose down'
alias dcl='docker-compose logs'
alias dclf='docker-compose logs -f'

# gem
alias gemb='gem build *.gemspec'
alias gemp='gem push *.gem'

# npm
alias npmg="npm i -g "
alias npmS="npm i -S "
alias npmD="npm i -D "
alias npmE='PATH="$(npm bin)":"$PATH"'
alias npmO="npm outdated"
alias npmV="npm -v"
alias npmL="npm list"
alias npmL0="npm ls --depth=0"
alias npmst="npm start"
alias npmt="npm test"
alias npmR="npm run"
alias npmP="npm publish"

# postgres
alias startpost='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias stoppost='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias restartpost='stoppost && sleep 1 && startpost'
alias reloadpost='pg_ctl reload -D /usr/local/var/postgres -s'
alias statuspost='pg_ctl status -D /usr/local/var/postgres -s'

# rails
alias devlog='tail -f log/development.log'
alias prodlog='tail -f log/production.log'
alias testlog='tail -f log/test.log'

alias -g RED='RAILS_ENV=development'
alias -g REP='RAILS_ENV=production'
alias -g RET='RAILS_ENV=test'

alias rc='rails console'
alias rcs='rails console --sandbox'
alias rd='rails destroy'
alias rdb='rails dbconsole'
alias rgm='rails generate migration'
alias rp='rails plugin'
alias ru='rails runner'
alias rs='rails server'
alias rsd='rails server --debugger'
alias rsp='rails server --port'

alias rdm='rake db:migrate'
alias rdms='rake db:migrate:status'
alias rdr='rake db:rollback'
alias rdc='rake db:create'
alias rds='rake db:seed'
alias rdd='rake db:drop'
alias rdrs='rake db:reset'
alias rdtc='rake db:test:clone'
alias rdtp='rake db:test:prepare'
alias rdmtc='rake db:migrate db:test:clone'
alias rdsl='rake db:schema:load'
alias rlc='rake log:clear'
alias rn='rake notes'
alias rr='rake routes'
alias rt='rake test'
alias rmd='rake middleware'
alias rsts='rake stats'

# rake
alias rake='noglob rake'
alias brake='noglob bundle exec rake'
alias srake='noglob sudo rake'
alias sbrake='noglob sudo bundle exec rake'

# mollifier/anyframe
alias U='cd-gitroot'
