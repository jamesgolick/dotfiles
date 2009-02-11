export PATH=~/script:/usr/local/bin:/usr/local/mysql/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:$PATH:/usr/local/jruby/bin:/usr/local/ec2-api-tools/bin:/usr/local/screenwm-1.0:~
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
export CDPATH=.:~:~/Documents:~/Documents/railsApps:/Library/Ruby/Gems/1.8/gems/
export HISTIGNORE="&:mutt:[bf]g:exit"
export HISTSIZE=10000
shopt -s histappend
export TERM=xterm-256color

# EC2
export EC2_INSTALLATION=giraffesoft
export EC2_CERT_PATH=~/.ec2/$EC2_INSTALLATION
export EC2_HOME=/usr/local/ec2-api-tools
export EC2_PRIVATE_KEY=$EC2_CERT_PATH/PrivateKey.pem
export EC2_CERT=$EC2_CERT_PATH/509Cert.pem
export EDITOR='vim'
export CLICOLOR=1
alias e=vim

# SVN 
alias ss='svn status'
alias smv='svn mv'
alias sc='svn commit'
alias srm='svn rm'
alias sup='svn up'
alias smkdir='svn mkdir'

# vim stuff

function vack() {
  ack $1 | vi -c"set buftype=nofile" -
}

# GIT
alias gs='git status'
alias ga='git add'
alias grm='git rm'
alias gc='git commit'
alias gmv='git mv'
alias gd='git diff'

function git_remove_missing_files() {
  gs | awk '/deleted:(.*)/ {print $3}' | xargs git rm
}

alias gcm='git commit -m'
alias gp='git push'
alias gpcd='git push && cap deploy'

# other
alias ka='killall -9'

# Rails Project
alias gen='script/generate'
alias mig='rake db:migrate && rake db:test:prepare'
alias con='script/console'
alias rs='touch tmp/restart.txt'
alias r=rake
rp()
{
  cd $1;
  mate .
  thin start -d
  autotest
}

#from jonathan
function ftf () {
  find "${@:-"."}" $FIND_OPTIONS -type f -print
}
export -f ftf

source ~/.bash/completion/git-completion.bash
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

export GEMDIR=`gem env gemdir`

gemdoc() {
  open $GEMDIR/doc/`$(which ls) $GEMDIR/doc | grep $1 | sort | tail -1`/rdoc/index.html
}

_gemdocomplete() {
  COMPREPLY=($(compgen -W '$(`which ls` $GEMDIR/doc)' -- ${COMP_WORDS[COMP_CWORD]}))
  return 0
}

complete -o default -o nospace -F _gemdocomplete gemdoc

