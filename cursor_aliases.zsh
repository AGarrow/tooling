function ccw() {
  if [ -z "$1" ]; then
    echo "Usage: ccw <ticket-number>"
    return 1
  fi

  local ticket_number=$1
  local worktree_output=$(git worktree list)
  local matching_worktree=$(echo "$worktree_output" | grep "$ticket_number")

  if [ -n "$matching_worktree" ]; then
    local worktree_path=$(echo "$matching_worktree" | awk '{print $1}')
    cursor "$worktree_path"
  else
    echo "No worktree found for ticket number: $ticket_number"
    echo ""
    echo "Available worktrees:"
    echo "$worktree_output"
    return 1
  fi
}

# Completion function for ccw
_ccw() {
  local -a worktree_tickets
  
  # Get worktree list and extract ticket numbers
  local worktrees=$(git worktree list 2>/dev/null)
  
  if [ -z "$worktrees" ]; then
    return
  fi
  
  # Extract ticket numbers from worktree output
  # Look for numeric sequences (likely ticket numbers) in paths and branch names
  local tickets=$(echo "$worktrees" | grep -oE '[0-9]{3,}|[A-Z]+-[0-9]+' | while read -r match; do
    # If it's a pattern like TICKET-123, extract just the number
    if echo "$match" | grep -qE '[A-Z]+-[0-9]+'; then
      echo "$match" | grep -oE '[0-9]+$'
    else
      echo "$match"
    fi
  done | sort -u)
  
  # Convert to array
  worktree_tickets=(${(f)tickets})
  
  _describe 'ticket numbers' worktree_tickets
}

compdef _ccw ccw

function ccd() {
  curr=$(pwd)
  target=~/benepass/${1}
  if [ -d $target ]
  then
    echo "repo exists locally"
    cursor $target
  else
    cd ~/cursor
    echo "cloning " git@github.com:benepass/${1}.git
    git clone git@github.com:benepass/${1}.git
    cursor $target
    cd $curr
  fi
}

ls_bp() {
 ls ~/bp/ ~/personal
}

# compdef -d -F ls_ws ccd
compdef ccd ls_bp