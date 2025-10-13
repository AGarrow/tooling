# Resolve the full absolute path to this script's directory
if command -v greadlink >/dev/null 2>&1; then
  READLINK_CMD="greadlink"
else
  READLINK_CMD="readlink"
fi

DIR="$(dirname "$($READLINK_CMD -f "$0" 2>/dev/null || realpath "$0")")"

autoload -Uz compinit
compinit
source "${DIR}/git_aliases.zsh"
source "${DIR}/rails_aliases.zsh"
source "${DIR}/django_aliases.zsh"
source "${DIR}/yarn_aliases.zsh"
source "${DIR}/zsh_aliases.zsh"
source "${DIR}/benepass_aliases.zsh"
source "${DIR}/aws_aliases.zsh"

eval "$(ssh-agent -s)"
eval "$(direnv hook zsh)"

bindkey -e
bindkey '^[[1;3C' vi-forward-word
bindkey '^[[1;3D' vi-backward-word

prompt='%U%F{green}%B%1d%u $:%b%f '