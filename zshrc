# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/Users/oleg/.oh-my-zsh"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$PATH:/Users/oleg/development/flutter/bin"
export NVM_DIR="$HOME/.nvm"
    [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"
eval "$(rbenv init -)"
eval "$(jump shell)"

ZSH_DISABLE_COMPFIX=true
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
# Plugins
plugins=(
 zsh-syntax-highlighting
 zsh-autosuggestions
)

# for Ctrl left and right
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

source $ZSH/oh-my-zsh.sh
# aliases
alias ber="bundle exec rspec"
alias checkrails="lsof -i tcp:5000"
alias cyspec="yarn cypress run --browser chrome --spec"
alias db_reseed="lsof -ti :5000 | xargs kill; lsof -ti :3000 | xargs kill; docker-compose stop hasura; rails db:drop && clear && rails db:create && clear  && rails db:migrate && clear && docker-compose start hasura && sleep 5 && clear  && cd ./hasura && hasura metadata apply && sleep 5 && cd ../ && rails db:seed && echo \u001b[32mOk || echo \u001b[35mERROR!!!!"
alias dbmd="rails db:migrate RAILS_ENV=development && rails db:migrate"
alias dbs="bundle exec bin/rails s -p 5000"
alias dcstart="docker-compose start hasura"
alias dcstop="docker-compose stop hasura"
alias dkall="docker container kill $(docker ps -q)"
alias dps="docker ps"
alias g="git"
alias gad="git add ."
alias gb="git branch"
alias gcm="git commit"
alias gco="git checkout"
alias gdb='git branch | grep -v "master\|staging" | xargs git branch -D'
alias gdb='git branch | grep -v "master\|staging" | xargs git branch -D'
alias go="git open"
alias gp="git pull"
alias gpush='git push origin HEAD'
alias grh="git reset --hard HEAD"
alias gs="git status"
alias gunstage="git restore --staged"
alias hma="hasura metadata apply"
alias hme="hasura metadata export"
alias pgrestoreprod="pg_restore --verbose --clean --no-acl --no-owner -h localhost -U $(whoami) -d acuity_development latest.dump && bin/rails db:migrate RAILS_ENV=development "
alias review="bin/review"
alias rrc="rails db:drop && rails db:create && rails db:migrate"
alias rseed="rails db:seed"
alias uncommit="git reset HEAD~"
alias vi="nvim"
alias vim="nvim"
alias vimrc="cd && vim .vimrc"
alias yco="yarn cypress open"
alias ys="yarn start"
alias start="/Users/oleg/Work/acuity/bin/dev.sh"
alias re_drop="dcstop && rrc && dbmd && dcstart && sleep 5 && cd hasura && hma && cd ../"

source /Users/oleg/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

