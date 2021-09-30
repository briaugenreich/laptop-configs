#add color to terminal syntax
export CLICOLOR=1

# Enable tab completion
source ~/.git-completion.bash

# colors!
green="\[\033[0;32m\]"
green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]"

# Change command prompt
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1="\n$purple\u$green\$(__git_ps1)$blue \W $ $reset"


#set aliases
alias ll='ls -la'
alias tf='terraform' 
