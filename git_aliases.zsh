edit() { cd ~/ws/$1 && gc master && gpl && subl . ;}

alias gs="git status"
alias gd="git diff"
alias gc="git checkout"
alias gcm="git commit -am"
alias gpl="git pull"
alias gps="git push"
alias gcb="git checkout -b"
alias gb="git branch | grep \* | cut -d ' ' -f2"
alias gf="git fetch"
alias grom="git rebase origin/master"
alias grc="git rebase --continue"
alias gm="gc master && gpl"

function ccd() {
  curr=$(pwd)
  target=~/ws/${1}
  if [ -d $target ]
  then
    echo "repo exists locally"
    code $target
  else
    cd ~/ws
    echo "cloning " git@github.com:wealthsimple/${1}.git
    git clone git@github.com:wealthsimple/${1}.git
    code $target
    cd $curr
  fi
}


## this will create a new branch on github with the same name as the current branch
## and open a new browser window with the pull requests page.
gpm() { gcm $1 && gps ;}
function gpsu { 
  output=$(git push --set-upstream origin $(gb) 2>&1);
  url=$(echo $output | grep "https:\/\/\S*" -o);
  open $url;
  echo $output;
}