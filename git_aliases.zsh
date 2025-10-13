edit() { cd ~/bp/$1 && gc $(gitMainBranch) && gpl && subl . ;}

function gitMainBranch() {
  if git branch | grep -q ' main$'; then
    echo 'main';
  else
    echo 'master';
  fi
}

alias gs="git status"
alias gd="git diff"
alias gc="git checkout"
alias gcm="git commit -am"
alias gpl="git pull"
alias gps="git push"
alias gcb="git checkout -b"
alias gb="git branch | grep \* | cut -d ' ' -f2"
alias gf="git fetch"
alias grom="git rebase origin/$(gitMainBranch)"
alias gromi="EDITOR=vi git rebase -i origin/$(gitMainBranch)"
alias grc="git rebase --continue"
alias gm="gc $(gitMainBranch) && gpl"
alias gsa="git stash apply"

function ccd() {
  curr=$(pwd)
  target=~/bp/${1}
  if [ -d $target ]
  then
    echo "repo exists locally"
    code $target
  else
    cd ~/benepass
    echo "cloning " git@github.com:benepass/${1}.git
    git clone git@github.com:benepass/${1}.git
    code $target
    cd $curr
  fi
}

ls_bp() {
 ls ~/bp/ ~/personal
}

# compdef -d -F ls_ws ccd
compdef ccd ls_bp

## this will create a new branch on github with the same name as the current branch
## and open a new browser window with the pull requests page.
gpm() { gcm $1 && gps ;}
function gpsu { 
  output=$(git push --set-upstream origin $(gb) 2>&1);
  url=$(echo $output | grep "https:\/\/\S*" -o);
  open $url;
  echo $output;
}

function go {
  url=$(git remote get-url origin);
  url=$(echo "$url" | sed -e 's/\.git//' -e 's/\:/\//' -e 's/git@/https\:\/\//');
  open $url;
}