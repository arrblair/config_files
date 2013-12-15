# terminal colors
export CLICOLOR=1
export TERM=xterm-color
export LSCOLORS=ExFxCxDxBxegedabagacad

# All PATH related options, TODO(Ryan)10/28/12: Investigate cleaning these up
export PATH=${PATH}:/usr/bin:/usr/local/bin
export PATH=${PATH}:/usr/local/mysql/bin
# export PATH=${PATH}:/Applications/android-sdks/tools
export PATH=${PATH}:/Applications/android-sdk-macosx/tools
export PATH=/usr/local/share/python:/usr/local/bin:$PATH
export GREP_OPTIONS='--color=auto'
export PYTHONPATH=/usr/local/Cellar/python/2.7.2/lib/python2.7/site-packages
export PATH=$PATH:/usr/local/sbin

# default editor selection
export EDITOR=vim

# bash command line completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# modify .bash_history
export HISTSIZE=100000
shopt -s histappend
export HISTTIMEFORMAT="%F %T "
# Just before every prompt command:
# (1) save the last command to history
# (2) flush the history in this shell
# (3) reload it from disk
# ... I wonder how slow this gets with 100k entries in the history file ...
PROMPT_COMMAND='history -a;history -c;history -r'
alias h='history 20'

# I think this is git auto-complete but I'm not sure
function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

# tab complete for fab commands
function fabcomp() { COMPREPLY=(`fab --shortlist | grep "^${COMP_WORDS[$COMP_CWORD]}"`); };
complete -F fabcomp fab

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"

PS1="$RED\$(date +%H:%M) \w$YELLOW \$(parse_git_branch)$GREEN\$ "
# PS1="\w \$(parse_git_branch)\$ "


# git related commands
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gg='git grep'
alias go='git checkout '
alias gm='git merge'
alias gl='git log'
alias gk='gitk --all&'
alias gx='gitx --all'
alias grv="git remote -v"
alias gp="git pull"

alias got='git '
alias get='git '

# ruby related custom commands
alias gpom='git push origin master'
alias gphm='git push heroku master'
alias sgi='sudo gem install --no-rdoc --no-ri'
alias gi='gem install --no-rdoc --no-ri'


alias spec="rspec --color --format nested"
alias cdrs="cd ~/ruby/sandbox"
alias cdrt="cd ~/ruby/sandbox/tumblr"
alias cdrsn="cd ~/ruby/sandbox/sinatra"


# bash related custom commands
alias ..="cd .."
alias e="exit"
alias _='cd -'
alias q='cd q'
alias ll='ls -la'
alias sb='source .bash_profile'
alias b='vi .bash_profile'
alias psa='ps auxww'
alias psg='ps aux -vvv | grep -i'
alias gh='history | grep -i'

# prints character count per line for adhering to PEP 8
alias cc="awk '{ print \$0 \" = \" length(\$0) }'"

# run find through the current directory and then grep the results
alias gf='find . | grep -i'

# list files by date
alias lsd='ls -lcat'

# list files by size
alias lsize='ll -S'

# pkill case insensitive
alias pk='pkill -i'
alias lfo='cd lfo'
alias luc='cd luc'
alias tac='gcat'
alias pkill='pkill -i'

# careful with that axe, Eugene
alias rmF='rm -rf'

# django related changes
alias manage.py='python manage.py'

# MacPorts Installer addition on 2011-05-18_at_00:41:09: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# Less Colors for Man Pages 
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking 
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold 
export LESS_TERMCAP_me=$'\E[0m'           # end mode 
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode 
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box 
export LESS_TERMCAP_ue=$'\E[0m'           # end underline 
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

function path(){
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}
