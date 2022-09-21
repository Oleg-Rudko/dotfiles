# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/Users/olegrudko/.oh-my-zsh"
export GEM_HOME="$HOME/.gem"
export PATH="$HOME/.rbenv/bin:$PATH"

# for asdf
# . /usr/local/opt/asdf/libexec/asdf.sh
# finish asdf
# for rbenv
eval "$(rbenv init -)"
# finish rbenv
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
alias nplug="nvim --cmd 'set rtp+=$(pwd)' ."
alias checkrails="lsof -i tcp:5000"
alias cyspec="yarn cypress run --browser chrome --spec"
alias db_reseed="lsof -ti :5000 | xargs kill; lsof -ti :3000 | xargs kill; docker-compose stop hasura; rails db:drop && clear && rails db:create && clear  && rails db:migrate && clear && docker-compose start hasura && sleep 5 && clear  && cd ./hasura && hasura metadata apply && sleep 5 && cd ../ && rails db:seed && echo \u001b[32mOk || echo \u001b[35mERROR!!!!"
kill="kill -9 $(lsof -ti:3000,5000)"
alias dbmd="rails db:migrate RAILS_ENV=development && rails db:migrate"
alias dbs="bundle exec bin/rails s -p 5000"
alias dcstart="docker-compose start hasura"
alias dcstop="docker-compose stop hasura"
alias dkall="docker container kill $(docker ps -q)"
alias dps="docker ps"
alias killruby="kill -9 $(lsof -i tcp:5000 -t)"
alias g="git"
alias gad="git add ."
alias gb="git branch"
alias gcm="git commit"
alias gco="git checkout"
alias gdb='git branch | grep -v "master\|staging" | xargs git branch -D'
alias gdb='git branch | grep -v "master\|staging" | xargs git branch -D'
alias go="gh browse"
alias gp="git pull"
alias gpush='git push origin HEAD'
alias grh="git reset --hard HEAD"
alias rails="bundle exec rails"
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
alias vimrc="cd && vi .vimrc"
alias initrc="cd && cd .config/nvim && vi init.vim"
alias yco="yarn cypress open"
alias ys="yarn start"
alias re_hma="cd && cd ./Work/acuity/rails_api/hasura/ && hasura metadata apply && cd ../../"
alias re_drop="dcstop && rrc && dbmd && dcstart && sleep 5 && cd hasura && hma && cd ../"

source /Users/olegrudko/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
