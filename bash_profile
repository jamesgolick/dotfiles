export PATH=~/script:/usr/local/bin:/usr/local/mysql/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:$PATH:/usr/local/jruby/bin:/usr/local/ec2-api-tools/bin:/usr/local/screenwm-1.0:/usr/local/jruby/bin:~
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
export CDPATH=.:~:~/Documents:~/Documents/railsApps:/Library/Ruby/Gems/1.8/gems/
export HISTIGNORE="&:mutt:[bf]g:exit"
export HISTSIZE=10000
shopt -s histappend
export TERM=xterm-256color

# EC2
export EC2_INSTALLATION=fetlife
export EC2_CERT_PATH=~/.ec2/$EC2_INSTALLATION
export EC2_HOME=/usr/local/ec2-api-tools
export EC2_PRIVATE_KEY=$EC2_CERT_PATH/PrivateKey.pem
export EC2_CERT=$EC2_CERT_PATH/509Cert.pem
export AWS_ACCESS_KEY=`cat $EC2_CERT_PATH/access_key`
export AWS_SECRET_ACCESS_KEY=`cat $EC2_CERT_PATH/secret_access_key`
export EDITOR='vim'
export CLICOLOR=1
alias e=vim

# other
alias ka='killall -9'

rp()
{
  cd $1;
  mate .
  thin start -d
  autotest
}

# source all files in .bash/aliases
for file in $HOME/.bash/aliases/*.bash; do
  source $file
done

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

