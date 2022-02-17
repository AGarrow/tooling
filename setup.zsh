touch ~/.zshrc
ln -sf "$PWD/tooling.zsh" ~/tooling.zsh
grep -qxF 'source ~/tooling.zsh' ~/.zshrc || echo 'source ~/tooling.zsh' >> ~/.zshrc
source ~/.zshrc

git config --global core.hooksPath "$PWD/.git-templates/hooks/"