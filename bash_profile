if hostname | grep -q 'dal.fetlife'; then
  LOCATION="fetlife"
else
  LOCATION="home"
fi

if [ LOCATION = "home" ]; then
  export PATH=/Users/jamesgolick/bin:/usr/local/git/bin:~/script:/usr/local/bin:/usr/local/mysql/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:$PATH:/usr/local/jruby/bin:/usr/local/ec2-api-tools/bin:/usr/local/screenwm-1.0:/usr/local/jruby/bin:~
  export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
fi

export CDPATH=.:~:~/Documents:~/Documents/railsApps:/Library/Ruby/Gems/1.8/gems/
export HISTIGNORE="&:mutt:[bf]g:exit"
export HISTSIZE=10000
export TERM=xterm-256color

# EC2
export EC2_INSTALLATION=fetlife
export EC2_CERT_PATH=~/.ec2/$EC2_INSTALLATION
export EC2_HOME=/usr/local/ec2-api-tools
export EC2_PRIVATE_KEY=$EC2_CERT_PATH/PrivateKey.pem
export EC2_CERT=$EC2_CERT_PATH/509Cert.pem
if [ -d $EC2_CERT_PATH ]; then
  export AWS_ACCESS_KEY=`cat $EC2_CERT_PATH/access_key`
  export AWS_SECRET_ACCESS_KEY=`cat $EC2_CERT_PATH/secret_access_key`
fi;
export EDITOR='vim'
export CLICOLOR=1
alias e=vim

# other
alias ka='killall -9'

# ruby gc settings
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=2
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_FREE_MIN=500000
export RUBY_HEAP_MIN_SLOTS=40000

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

gemdoc() {
  open $GEMDIR/doc/`$(which ls) $GEMDIR/doc | grep $1 | sort | tail -1`/rdoc/index.html
}

_gemdocomplete() {
  COMPREPLY=($(compgen -W '$(`which ls` $GEMDIR/doc)' -- ${COMP_WORDS[COMP_CWORD]}))
  return 0
}

complete -o default -o nospace -F _gemdocomplete gemdoc

# set some options
shopt -s histappend
shopt -s extglob
shopt -s cdspell
shopt -s hostcomplete
shopt -s no_empty_cmd_completion
shopt -s cmdhist

# fuck that you have new mail shit (from rtomayko's dotfiles)
unset MAILCHECK

##
# Your previous /Users/james/.bash_profile file was backed up as /Users/james/.bash_profile.macports-saved_2009-08-31_at_14:31:23
##

# MacPorts Installer addition on 2009-08-31_at_14:31:23: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


# rvm installer added line:
#if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi

# I don't like colour in my backtraces. Yes, I said colour.
RBX_NOCOLOR=1

export GEMDIR=`gem env gemdir`

export NODE_PATH=/usr/local/lib/node_modules
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/

export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
