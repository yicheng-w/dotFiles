# Old stuff {{{

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=5000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

bind TAB:menu-complete

export EDITOR=vim

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# }}}
# Custom Bash Prompt {{{

ANSIRED="\033[1;31m"
ANSIGREEN="\033[1;32m"
ANSIYELLOW="\033[1;33m"
ANSIDARKBLUE="\033[1;34m"
ANSIMAGENTA="\033[1;35m"
ANSIBLUE="\033[1;36m"
ANSIDARKGREEN="\033[0;32m"
ANSIRESET="\033[m"


#Underlined
UBlack="\033[4;30m" # Black
URed="\033[4;31m" # Red
UGreen="\033[4;32m" # Green
UYellow="\033[4;33m" # Yellow
UBlue="\033[4;34m" # Blue
UPurple="\033[4;35m" # Purple
UCyan="\033[4;36m" # Cyan
UWhite="\033[4;37m" # White

# Background
On_Black="\033[40m" # Black
On_Red="\033[41m" # Red
On_Green="\033[42m" # Green
On_Yellow="\033[43m" # Yellow
On_Blue="\033[44m" # Blue
On_Purple="\033[45m" # Purple
On_Cyan="\033[46m" # Cyan
On_White="\033[47m" # White

git_prompt () {
	if git rev-parse --git-dir > /dev/null 2>&1; then

        git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')

        if git diff --quiet 2>/dev/null >&2; then
            git_color="$UGreen"
        else
            git_color="$URed"
        fi

        printf "$ANSIDARKBLUE \b\b $ANSIRESET[$git_color$git_branch$ANSIRESET]"
    else
        printf ""
    fi
}

time_prompt() {
    if $showTime; then
        if $showDate ; then
            printf "$(date +%a-%Y/%m/%d) | $(date +%H:%M:%S)"
        else
            printf "$(date +%H:%M:%S)"
        fi
    fi
}

user_prompt() {
    if $showUsr; then
        if $showHost; then
            printf "$USER@$HOSTNAME"
        else
            printf "$USER"
        fi
    fi
}

SensorTemp() {
    # Note on usage 1: you must prepend an escape character onto $(SensorTemp) so the prompt dynamically updates the temperature
    # Note on usage 2: modify the arguments for head and tail to select a specific temperature in the output
    if [ $showSysInfo == true ]; then
        printf "<$(sensors | grep -Eo '[0-9][0-9]\.[0-9]°C' | head -1) | "
    fi
}
ramUsage() {
    if [[ $showSysInfo == true ]]; then
        printf "$(free -m | grep -Eo '[0-9]*' | head -7 | tail -1) MB | "
    fi
}
batteryInfo() {
    if [[ $showSysInfo == true ]]; then
        data=$(acpi | grep -Eo "[0-9]*%|[0-9][0-9]:[0-9][0-9]:[0-9][0-9]")
        perc=$(echo $data | grep -Eo "[0-9]*%")
        batTime=$(echo $data | grep -Eo "[0-9][0-9]:[0-9][0-9]:[0-9][0-9]")
        if [ "$batTime" == "" ]; then
            batTime="Full"
        fi
        printf "$perc ($batTime)>" 2>/dev/null
    fi
}

Pwd() {
    printf "$PWD" | sed -r "s|$HOME|~|g"
}

EXIT=0
export PROMPT_COMMAND=__prompt_cmd

function __prompt_cmd() {
    EXIT=$?
    local ANSIHI
    local symbol1
    local symbol2
    local GITSTATUS=""

    if git rev-parse --git-dir > /dev/null 2>&1; then
        GITSTATUS="\\[\033[0;32m\\]git \\[$ANSIRESET\\]"
    fi

    if [ "$EXIT" = "0" ]; then
        ANSIHI=$ANSIGREEN
        symbol2=">> "
    else
        ANSIHI=$ANSIRED
        symbol2="[$EXIT] xx "
    fi

    if [[ $EUID -ne 0 ]]; then
        symbol1="♞ "
    else
        symbol1="♛ "
    fi

    PS1="[\\[$ANSIYELLOW\\]\$(time_prompt)\\[$ANSIRESET\\]] \\[$ANSIGREEN\\]\$(user_prompt)\\[$ANSIRESET\\]: \\[$ANSIBLUE\\]\$(Pwd)\\[$ANSIRESET\\] > \\[$ANSIMAGENTA\\]\$(SensorTemp)\$(ramUsage)\$(batteryInfo)\\[$ANSIRESET\\] \$(git_prompt)\n\\[$ANSIHI\\]$symbol1$symbol2$GITSTATUS\\[$ANSIRESET\\]"

}

# Config Options

showDate=false
showTime=true
showUsr=true
showHost=false
showSysInfo=false

sysInfo() {
     if [[ $showSysInfo == true ]]; then
        export showSysInfo=false
    else
        export showSysInfo=true
    fi
}

dateInfo() {
    if [[ $showDate == true ]]; then
        export showDate=false
    else
        export showDate=true
    fi
}

hostInfo() {
    if [[ $showHost == true ]]; then
        export showHost=false;
    else
        export showHost=true;
    fi
}

# }}}
# Custom Functions {{{

hourglass(){ trap 'tput cnorm' 0 1 2 15 RETURN;local s=$((SECONDS + 1));(tput civis;while (($SECONDS<$s));do for f in '|' '\' '-' '/';do echo -n "$f";sleep .2s;echo -n $'\b';done;done;);}

rm='rm -i'
rmdir='rmdir -i'

timer() {
    SECS=$1
    while [[ 0 -ne $SECS ]]; do
        echo -n "$SECS..."
        sleep 1
        SECS=$[$SECS-1]
    done
    echo
    echo "TIME's UP"
}

stopwatch() {
    SECS=1
    while true
    do
        echo "$SECS"
        SECS=$[$SECS+1]
        sleep 1
    done
}

dropboxBackup() {
    dropbox start;
    cp -r $@ ~/Dropbox/
}

toDo() {
    case $1 in
        -a)
            echo "$2" >> ~/.toDoList
            cat ~/.toDoList
            ;;
        -r)
            grep -v "$2" ~/.toDoList > ~/.toDoListTemp
            mv ~/.toDoListTemp ~/.toDoList
            ;;
        -d)
            cat ~/.toDoList
            ;;
    esac
}

back() {
    eval cd $(echo $OLDPWD | sed -r 's/[ ]+/\\ /g')
}

# Git functions {{{
git_check () {
	if git rev-parse --git-dir > /dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

add() { if git_check $0; then git add "$@" -A; else echo "Not a git directory!" ; fi }

commit() { if git_check $0; then git commit; else echo "Not a git directory!"; fi }

push() { if git_check $0; then git push ; else echo "Not a git directory!"; fi }

status() { if git_check $0; then git status; else status; fi }

pull() { if git_check $0; then git pull; else echo "Not a git directory!"; fi }

# }}}
# }}}
 # aliases {{{
alias sourceBash='source ~/.bashrc'
alias aptproxyget='~/.aptproxyget/apt-proxy-get.sh'
alias retrieveOctoDex='~/.octodex/octodex-download.sh'
alias haskell='ghci'
alias blender='~/blender/blender'
alias tunnelWhiteHat='ssh -D 9001 whitehatacademy.club -l whitehats'
alias sublime='~/.SublimeText/sublime_text'
alias notepad++='wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Notepad++/notepad++.exe'
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias netlogo="~/.netlogo-5.1.0/netlogo.sh"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# }}}
