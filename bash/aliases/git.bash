alias gs='git status'
alias ga='git add'
alias grm='git rm'
alias gc='git commit'
alias gmv='git mv'
alias gd='git diff'
alias gcm='git commit -m'
alias gp='git push'
alias gpcd='git push && cap deploy'

function git_remove_missing_files() {
  gs | awk '/deleted:(.*)/ {print $3}' | xargs git rm --ignore-unmatch
}
