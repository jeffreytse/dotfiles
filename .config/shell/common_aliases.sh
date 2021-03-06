# Bash helper alias
LSARG='aFl'
LISTC=$(command -v exa > /dev/null 2>&1 && echo 'exa' || echo 'ls --color=tty');
LISTC_N_ARGS=$(command -v exa > /dev/null 2>&1 && echo 'exa -ag'$LSARG || echo 'ls -'$LSARG);

alias ..='cd ..'
alias ...='cd ../.. && pwd'
alias ls=$LISTC
alias ll=$LISTC_N_ARGS
alias man=$(command -v batman > /dev/null 2>&1 && echo 'batman' || echo 'man')
alias cat=$(command -v bat > /dev/null 2>&1 && echo 'bat' || echo 'cat')

alias v='nvim'
alias vi='nvim'
alias vim='nvim'
# alias nvim='nvim'
## Use vimrc with sudo vim
alias suvim='sudo -E nvim'
## Will make parent directories if they don't exist
## Also verbose
alias mkdir="mkdir -pv"
alias whatismyip="curl https://ipecho.net/plain; echo"
## Make file executable
alias chmodx='chmod 755'
## Make file read/write-able
alias chmodrw='chmod 644'
## print bash function declaration in console
## Used to make sure profile changes are reflecting
alias echodec='declare -f'

#node aliases
alias :q='exit'

# add alias for MR on command
mr_init() {
  export NODE_PATH=~/dvlpmnt/node/mr/actual/mr_modules
  export NODE_ENV=local
  /usr/bin/docker start mr-mongo mr-mysql-sanitized mr_redis_1 > /dev/null
}
mr_sd() {
  /usr/bin/docker stop mr-mongo mr-mysql-sanitized mr_redis_1 > /dev/null
}

mr_th() {
  mr_init
  npm run dev-tophat
}

mr_rv() { mr_cc }
mr_cc() {
  mr_init
  npm run dev-cc
}

mr_ws() {
  mr_init
  npm run dev-website
}

mr_pcm() {
  mr_init
  npm run dev-pcm
}

mr_rv_tests() {
  mr_init
  cd ~/dvlpmnt/node/mr/actual/raven
  npm run test
}

mr_rv_stories() {
  mr_init
  cd ~/dvlpmnt/node/mr/actual/raven
  npm run stories
}

