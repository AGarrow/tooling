touch ~/.zshrc
ln -sf "$PWD/dotfiles/tooling.zsh" ~/tooling.zsh
grep -qxF 'source ~/tooling.zsh' ~/.zshrc || echo 'source ~/tooling.zsh' >> ~/.zshrc
source ~/.zshrc