touch ~/.zshrc
ln -sf "$PWD/tooling.zsh" ~/dotfiles/tooling.zsh
grep -qxF 'source ~/dotfiles/tooling.zsh' ~/.zshrc || echo 'source ~/dotfiles/tooling.zsh' >> ~/.zshrc
source ~/.zshrc