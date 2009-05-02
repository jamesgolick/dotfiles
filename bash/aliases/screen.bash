alias sls='screen -ls'
alias s='screen_resume_or_start'
 
function screen_resume_or_start() {
  screen -r $1 || screen -S $1
}

