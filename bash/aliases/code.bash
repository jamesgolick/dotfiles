function gdef() {
  grep -r "def $1" $2
}

function gclass() {
  grep -r "class $1" $2
}

function gmodule() {
  grep -r "module $1" $2
}
