function rcs() {
  wolfman rcon -a "${PWD##*/}" -e staging $1 $2
}

function rcp() {
  wolfman rcon -a "${PWD##*/}" -e prod $1 $2
}