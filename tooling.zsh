DIR="$(dirname $(greadlink -f $0))"
source "${DIR}/git_aliases.zsh"
source "${DIR}/rails_aliases.zsh"
source "${DIR}/yarn_aliases.zsh"
source "${DIR}/wealthsimple_aliases.zsh"
source "${DIR}/zsh_aliases.zsh"
eval "$(direnv hook zsh)"