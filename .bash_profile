export CLICOLOR=1
export TERM=xterm-color
export LSCOLORS=ExFxCxDxBxegedabagacad
export PATH=${PATH}:~/ruby/rudo/
# export PATH=${PATH}:/Applications/android-sdks/tools
export PATH=${PATH}:/Applications/android-sdk-macosx/tools

# modify .bash_history
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"

PS1="$RED\$(date +%H:%M) \w$YELLOW \$(parse_git_branch)$GREEN\$ "
# PS1="\w \$(parse_git_branch)\$ "

alias spec="rspec --color --format nested"

alias cdrs="cd ~/ruby/sandbox"
alias cdrt="cd ~/ruby/sandbox/tumblr"
alias cdrsn="cd ~/ruby/sandbox/sinatra"
alias ..="cd .."

alias cdqh="cd ~/Desktop/queerheads/diaspora"

alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gm='git merge'
alias gl='git log'
alias gk='gitk --all&'
alias gx='gitx --all'
alias grv="git remote -v"

alias got='git '
alias get='git '

alias gpom='git push origin master'
alias gphm='git push heroku master'
alias sgi='sudo gem install --no-rdoc --no-ri'
alias gi='gem install --no-rdoc --no-ri'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

##
# Your previous /Users/nfowler/.bash_profile file was backed up as /Users/nfowler/.bash_profile.macports-saved_2011-05-18_at_00:41:09
##

# MacPorts Installer addition on 2011-05-18_at_00:41:09: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

