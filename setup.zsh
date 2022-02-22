# setup tooling
touch ~/.zshrc
ln -sf "$PWD/tooling.zsh" ~/tooling.zsh
grep -qxF 'source ~/tooling.zsh' ~/.zshrc || echo 'source ~/tooling.zsh' >> ~/.zshrc
source ~/.zshrc

# config git hooks
git config --global core.hooksPath "$PWD/.git-templates/hooks/"

# config git ignore
git config --global core.excludesfile "$PWD/git/.gitignore"

# config slate
if ! test -f "/Applications/Slate.app"; then
  echo "slate already installed"
else
  curr=$(pwd)
  ln -sf "$PWD/.slate" ~/.slate
  cd /Applications && curl http://www.ninjamonkeysoftware.com/slate/versions/slate-latest.tar.gz | tar -xz
  open Slate.app
  cd $curr
fi

