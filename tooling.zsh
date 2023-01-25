DIR="$(dirname $(greadlink -f $0))"
autoload -Uz compinit
compinit
source "${DIR}/django_aliases.zsh"
source "${DIR}/git_aliases.zsh"
source "${DIR}/postgres_aliases.zsh"
source "${DIR}/rails_aliases.zsh"
source "${DIR}/wealthsimple_aliases.zsh"
source "${DIR}/benepass_aliases.zsh"
source "${DIR}/yarn_aliases.zsh"
source "${DIR}/zsh_aliases.zsh"

eval "$(direnv hook zsh)"

prompt='%U%F{green}%B%1d%u $:%b%f '