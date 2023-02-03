# install coreutils
brew install coreutils

# setup tooling
touch ~/.zshrc
ln -sf "$PWD/tooling.zsh" ~/tooling.zsh
grep -qxF 'source ~/tooling.zsh' ~/.zshrc || echo 'source ~/tooling.zsh' >> ~/.zshrc
source ~/.zshrc

# config git hooks
git config --global core.hooksPath "$PWD/.git-templates/hooks/"

# config git ignore
git config --global core.excludesfile "$PWD/git/.gitignore"

# install direnv
brew install direnv

# config slate
if [ ! test -f "/Applications/Slate.app"]; then
  echo "slate already installed"
else
  curr=$(pwd)
  ln -sf "$PWD/.slate" ~/.slate
  # todo: unpack & unzip this, get a darn cert for personal site.
  # cd /Applications && curl http://alexi-garrow.com/Slate.zip && unzip Slate.zip
  cd /Applications
  open Slate.app
  cd $curr
fi

