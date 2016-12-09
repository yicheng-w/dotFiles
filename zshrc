# General Config {{{

# Path to your oh-my-zsh installation.
# export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="yeech"
# ZSH_THEME="xiong-chiamiov"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# User configuration
#

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"
#
ZSH=/home/yicheng-wang/.zsh

HIST_STAMPS="mm/dd/yyyy"
HISTSIZE=1000
HISTFILESIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE

export EDITOR="vim"

setopt AUTO_CD
setopt AUTO_PUSHD
setopt EXTENDED_GLOB
setopt PUSHD_SILENT
setopt PUSHD_TO_HOME
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt ZLE
setopt VI
unsetopt EQUALS

# use cache when auto-completing
zstyle ':completion::complete:*' use-cache 1
# use case-insensitive auto-completing
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# graphical auto-complete menu
zstyle ':completion:*' menu select

# use automatic path prediction
# $predict-on to turn on and $predict-off to turn off
autoload predict-on
autoload predict-off
# use advanced completion system
autoload -U compinit && compinit

#bind TAB:menu-complete

if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
elif [ "$TERM" == "screen" ]; then
    export TERM=screen-256color
fi
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=01;92:st=37;44:ex=01;04:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'
export LS_COLORS


# source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
source $ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# }}}
  # Custom Prompt {{{
 #
function git_prompt() {
	if git rev-parse --git-dir > /dev/null 2>&1; then

        git_branch=$(git branch 2>/dev/null | sed -n '/^\*/s/^\* //p')

        echo -n "["
        git for-each-ref --format="%(refname:short) %(upstream:short)" refs/heads |\
        grep $git_branch |\
        while read local remote
        do
            [ -z "$remote" ] && continue
            LEFT_AHEAD='0'
            RIGHT_AHEAD='0'
            if [[ $showDiff == true ]]; then
                git fetch -q 2>/dev/null
                git rev-list --left-right ${local}...${remote} -- 2>/dev/null >/tmp/git_upstream_status_delta || continue
                LEFT_AHEAD=$(grep -c '^<' /tmp/git_upstream_status_delta)
                RIGHT_AHEAD=$(grep -c '^>' /tmp/git_upstream_status_delta)
                if [[ $LEFT_AHEAD == '0' && $RIGHT_AHEAD == '0' ]]; then
                    if git diff --quiet 2>/dev/null >&2; then
                        echo "%{$(tput smul)$(tput setaf 28)%}$git_branch%{$(tput sgr0)%}] "
                    else
                        echo "%{$(tput smul)$(tput setaf 1)%}$git_branch%{$(tput sgr0)%}] "
                    fi
                else
                    echo "%{$(tput smul)$(tput setaf 1)%}$git_branch (▲ $LEFT_AHEAD | ▼ $RIGHT_AHEAD)%{$(tput sgr0)%}] "
                fi
            else
                if git diff --quiet 2>/dev/null >&2; then
                    echo "%{$(tput smul)$(tput setaf 28)%}$git_branch%{$(tput sgr0)%}] "
                else
                    echo "%{$(tput smul)$(tput setaf 1)%}$git_branch%{$(tput sgr0)%}] "
                fi
            fi
        done
    else
        echo ""
    fi
}

function time_prompt() {
    if $showTime; then
        if $showDate ; then
            echo "[%{$(tput bold)$(tput setaf 11)%}$(date +%a-%Y/%m/%d) | $(date +%H:%M:%S)%{$(tput sgr0)%}]"
        else
            echo "[%{$(tput bold)$(tput setaf 11)%}$(date +%H:%M:%S)%{$(tput sgr0)%}]"
        fi
    fi
}

function user_prompt() {
    if $showUsr; then
        if $showHost; then
            local THEIP=$(ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}')
            echo "%{$(tput bold)$(tput setaf 10)%}$USER@$(hostname) ($THEIP)%{$(tput sgr0)%}"
        else
            echo "%{$(tput bold)$(tput setaf 10)%}$USER%{$(tput sgr0)%}"
        fi
    fi
}

function SensorTemp() {
    # Note on usage 1: you must prepend an escape character onto $(SensorTemp) so the prompt dynamically updates the temperature
    # Note on usage 2: modify the arguments for head and tail to select a specific temperature in the output
    if [ $showSysInfo == true ]; then
        echo "%{$(tput bold)$(tput setaf 166)%}<$(sensors | grep -Eo '[0-9][0-9]\.[0-9]°C' | head -1) | "
    fi
}
function ramUsage() {
    if [[ $showSysInfo == true ]]; then
        echo "$(free -m | grep -Eo '[0-9]*' | head -7 | tail -1) MB | "
    fi
}
function cpuInfo() {
    grep 'cpu' /proc/stat | head -n 1 | cut -d" " -f $1
}
function cpuUsage() {
    if [[ $showSysInfo == true ]]; then
        local idle=$(cpuInfo 6)
        local active=$(($(cpuInfo 3) + $(cpuInfo 5) + $(cpuInfo 7)))
        local total=$(($active + $idle))
        local perc=$(bc <<< "scale = 2; $active * 100 / $total")
        echo "$perc%% | "
    fi
}


function batteryInfo() {
    if [[ $showSysInfo == true ]]; then
        data=$(acpi | grep -Eo "[0-9]*%|[0-9][0-9]:[0-9][0-9]:[0-9][0-9]")
        perc=$(echo $data | grep -Eo "[0-9]*%")
        batTime=$(echo $data | grep -Eo "[0-9][0-9]:[0-9][0-9]:[0-9][0-9]")
        if [ "$batTime" == "" ]; then
            batTime="Full"
        fi
        echo "$perc% ($batTime)> %{$(tput sgr0)%}" 2>/dev/null
    fi
}

function compactBattery() {
    block="▉"
    charging="⚡"
    if [[ $(acpi | cut -d" " -f3) == 'Discharging,' ]]; then
        charging=""
    fi

    data=$(acpi | grep -Eo "[0-9]*%" | cut -d'%' -f1)
    blockcount=$((($data + 5) / 10))
    blocks=""
    for ((i = 0 ; i < $blockcount ; ++i)); do
        blocks=$(echo $blocks$block)
    done
    for ((i = $blockcount ; i < 10 ; ++i)); do
        blocks=$(echo "$blocks░")
    done
    echo -n "%{$(tput bold)%}"
    if [[ $charging == "" ]]; then
        if [ $blockcount -gt 4 ]; then
            echo -n "%{$(tput setaf 10)%}"
        elif [ $blockcount -gt 2 ]; then
            echo -n "%{$(tput setaf 11)%}"
        else
            echo -n "%{$(tput setaf 9)%}"
        fi
    else
        echo -n "%{$(tput setaf 10)%}"
    fi
    echo "$charging ▏$blocks▕%{$(tput sgr0)%}"
}
function Pwd() {
    if [[ $shortenPath == true ]]; then
        if [ $(printf "$PWD" | sed -r "s|$HOME|~|g" | wc -c | tr -d " ") -gt $pwdLength ]; then
            echo -n "%{$(tput bold)$(tput setaf 50)%}~/...$(echo -n $PWD | sed -e "s/.*\(.\{$pwdLength\}\)/\1/")"
        else
            echo -n "%{$(tput bold)$(tput setaf 50)%}$PWD" | sed -r "s|$HOME|~|g"
        fi
    else
        echo -n "%{$(tput bold)$(tput setaf 50)%}$PWD" | sed -r "s|$HOME|~|g"
    fi
    echo "%{$(tput sgr0)%}"
}

function dirPrompt() {
    if [[ $showDirInfo == true ]]; then
        size=$(du -h -s | tr -d '\t.') 2> /dev/null
        fileCount=$(ls -l | wc -l | sed 's: ::g')
        echo "%{$(tput bold)$(tput setaf 50)%}{ $fileCount files | $size$b } %{$(tput sgr0)%}"
    fi
}

function networkPrompt() {
    if [[ $showNetworkInfo == true ]]; then
        if [[ $(nm-tool | sed -n "4p") < "State: disconnected" ]]; then
            # connected
            local network="$(nm-tool | sed -n '6p' | cut -d "[" -f2 | cut -d "]" -f1)"
            local speed="$(nm-tool | grep "Speed" | cut -d ":" -f2 | tr -d ' ')"
            echo "%{$(tput bold)$(tput setaf 129)%}[ $network | $speed ] %{$(tput sgr0)%}"
        else
            echo "%{$(tput bold)$(tput setaf 11)%}[ Disconnected ] %{$(tput sgr0)%}"
        fi
    fi
}

function reminders_prompt() {
    reminders="$(cat ~/.reminder | tr '\n' '; ' | cut -d';' -f2-)"
    if [[ $reminders == "" ]]; then
        echo ""
    else
        echo "%{$(tput setaf 11)%}(Reminder: $reminders)%{$(tput sgr0)%} "
    fi
}

function CatchExitCode() {
    EXIT=$?
}

function Sign() {
    local ANSIHI
    local symbol1
    local symbol2
    local GITSTATUS=""

    if [ "$EXIT" = "0" ]; then
        echo -n "%{$(tput bold)$(tput setaf 10)%}"
        symbol2="─(%!)─>> "
    else
        echo -n "%{$(tput bold)$(tput setaf 1)%}"
        symbol2="─[$EXIT]─(%!)─xx "
    fi

    if [[ $EUID -ne 0 ]]; then
        echo -n "♞ "
    else
        echo -n "♛ "
    fi

    echo -n "{%(0j.%j.)}"

    echo -n "$symbol2%{$(tput sgr0)%}"

    if git rev-parse --git-dir > /dev/null 2>&1; then
        echo "%{$(tput setaf 34)%}git %{$(tput sgr0)%}"
    else
        echo ""
    fi
}

EXIT=0
#export PROMPT_COMMAND=__prompt_cmd

#TMOUT=1

function TRAPALRM() {
    if [[ $showDiff == false && $changeClock == true ]]; then
        zle reset-prompt
    fi
}

function precmd() {
    CatchExitCode
}

setopt prompt_subst

function prompt_command() {
    # real async uses filedescriptors and file hack
    time_prompt > prompt_backing_file &
    user_prompt > prompt_backing_file &
    Pwd > prompt_backing_file &
    reminders_prompt > prompt_backing_file &
    git_prompt > prompt_backing_file &
    SensorTemp > prompt_backing_file &
    ramUsage > prompt_backing_file &
    cpuUsage > prompt_backing_file &
    batteryInfo > prompt_backing_file &
    networkPrompt > prompt_backing_file &
    dirPrompt > prompt_backing_file &
    Sign > prompt_backing_file &
    wait
    exec 3< prompt_backing_file
    cat <&3
    #printf "%s %s: %s > %s%s%s%s%s%s%s%s\n%s" "$t" "$u" "$p" "$re" "$git" "$temp" "$ram" "$cpu" "$bat" "$net" "$dir" "$s"
}

prompt1="\$(time_prompt) \$(user_prompt): \$(Pwd) > \$(reminders_prompt)\$(git_prompt)\$(SensorTemp)\$(ramUsage)\$(cpuUsage)\$(batteryInfo)\$(networkPrompt)\$(dirPrompt)
\$(Sign)"

PROMPT=$prompt1
#PROMPT="\$(prompt_command)"
RPROMPT="\$(compactBattery)"

# PS - 2

function PS2Gen() {
    echo -n "%{$(tput bold)$(tput setaf 27)%}"
    # echo -n "       └(%_)─>> " clashes with reset-prompt, FIXME
    echo -n "       └───────>> "
    echo "%{$(tput sgr0)%}"
    export UsingPS2=true # DOESN'T DO CRAP FIXME
}

function isUsingPS2() {
    export UsingPS2=true
}

PS2="\$(PS2Gen)$(isUsingPS2)"

# Config Options

showDate=false
showTime=true
showUsr=true
showHost=false
showSysInfo=false
shortenPath=true
showDirInfo=false
showNetworkInfo=false
showDiff=false
changeClock=true
pwdLength=30

function changeClockInfo() {
    if [[ $changeClock == true ]]; then
        export changeClock=false;
    else
        export changeClock=true;
    fi
}

function gitDiffInfo() {
    if [[ $showDiff == true ]]; then
        export showDiff=false
    else
        export showDiff=true
    fi
}

function sysInfo() {
     if [[ $showSysInfo == true ]]; then
        export showSysInfo=false
    else
        export showSysInfo=true
    fi
}

function dateInfo() {
    if [[ $showDate == true ]]; then
        export showDate=false
    else
        export showDate=true
    fi
}

function hostInfo() {
    if [[ $showHost == true ]]; then
        export showHost=false;
    else
        export showHost=true;
    fi
}

function shortenPath() {
    if [[ $shortenPath == false ]]; then
        export shortenPath=true;
    else
        export shortenPath=false;
    fi
}

function dirInfo() {
    if [[ $showDirInfo == false ]]; then
        export showDirInfo=true;
    else
        export showDirInfo=false;
    fi
}

function networkInfo() {
    if [[ $showNetworkInfo == false ]]; then
        export showNetworkInfo=true;
    else
        export showNetworkInfo=false;
    fi
}

function defaultInfo() {
    export showDate=false;
    export showTime=true;
    export showUsr=true;
    export showHost=false;
    export showSysInfo=false;
    export shortenPath=true;
    export showDirInfo=false;
    export showNetworkInfo=false;
    export showDiff=false;
}

function maxInfo() {
    export showDate=true;
    export showTime=true;
    export showUsr=true;
    export showHost=true;
    export showSysInfo=true;
    export shortenPath=false;
    export showDirInfo=true;
    export showNetworkInfo=true;
    export showDiff=true;
}

 # }}}
# Global Functions {{{
function demoPrompt() {
    PS1="$ ";
    PS2="";
}

function sourcezsh(){
    source ~/.zshrc
}

function displayColors() {
    for i in `seq 1 256`; do
        echo -n "$(tput bold)$(tput setaf $i) $i ";
    done;
    echo -n "$(tput sgr0)"
}

function timer() {
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

check_update() {
    wget -q -O ~/.tmp/site-original $1;
    while true
    do
        wget -q -O ~/.tmp/site-current $1;
        if ! cmp ~/.tmp/site-original ~/.tmp/site-current >/dev/null 2>&1; then
            xdg-open $1;
            rm ~/.tmp/site-original ~/.tmp/site-current;
            return;
        fi
        sleep $2
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

cleanVimBackup() {
    read -p "Are you sure you want to delete all vim backups? " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
    rm ~/.vim/backup/*
}

function reminder() {
    echo "$@" >> ~/.reminder
    echo "Reminder set: $@"
}

function remove_reminder() {
    echo "" > ~/.reminder
}

function copy() {
    cat $@ | xclip -selection clipboard
}

function play_youtube() {
    xterm -geometry 640x480 -fn 5x7 -e "youtube-dl -f 36 \"$@\" -o - | mplayer -cache 7000 -noautosub -really-quiet -monitorpixelaspect 0.7 -vo aa:driver=curses:contrast=40 - "
}

# Git functions {{{
function git_check () {
	if git rev-parse --git-dir > /dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

function add() { if git_check $0; then git add "$@" -A; else echo "Not a git directory!" ; fi }
function commit() { if git_check $0; then git commit $@; else echo "Not a git directory!"; fi }
function push() { if git_check $0; then git push $@; else echo "Not a git directory!"; fi }
function status() { if git_check $0; then git status $@; else command status $@; fi }
function pull() { if git_check $0; then git pull $@; else echo "Not a git directory!"; fi }
function branch() { if git_check $0; then git branch $@; else echo "Not a git directory!"; fi }
function merge() { if git_check $0; then git merge $@; else echo "Not a git directory!"; fi }
function reset() { if git_check $0; then git reset $@; else command reset $@; fi }
function checkout() { if git_check $0; then git checkout $@; else echo "Not a git directory"; fi}
function log() { if git_check $0; then git log --abbrev-commit; else echo "Not a git directory"; fi}
function tree() { if git_check $0; then git log --graph --pretty=oneline --abbrev-commit; else command tree $@; fi}
function diff() { if git_check $0; then git diff $@; else command diff $@; fi}
function ignored() { if git_check $0; then git ls-files --other --ignored --exclude-standard; else echo "Not a git directory"; fi}
function stash() { if git_check $0; then git stash $@; else echo "Not a git directory"; fi }
 # }}}

# }}}
# Global Aliases {{{
alias ll='ls -alF'
alias la='ls -A'
alias lh='ls -ahl'
alias l='ls -CF'
alias rm='rm -I'

alias aptproxyget='~/.aptproxyget/apt-proxy-get.sh'
alias retrieveOctoDex='~/.octodex/octodex-download.sh'
alias haskell='ghci'
alias blender='~/blender/blender'
alias tunnelWhiteHat='ssh -D 9001 whitehatacademy.club -l whitehats'
alias tunnelServer='ssh -D 9001 104.236.86.43 -l root'
alias sublime='~/.SublimeText/sublime_text'
alias notepad++='wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Notepad++/notepad++.exe'

alias netlogo="~/.netlogo/NetLogo"
alias processing="~/.processing/processing"
alias processing-java="~/.processing/processing-java"
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

export TERM='xterm-256color'

alias sshServer="ssh -X root@104.236.86.43"
alias sshDojo="ssh -X yeech@162.243.115.175"

alias nethackMod="~/nethackPersonal/games/nethack"
alias clearScreen="echo -ne '\0033\0143'"
function woodo() {
    if [[ $(id -u) == 0 ]]; then
        echo '              @@@                      @@@              
             @///@     /@@            @;  @             
            @/  //@   /  ;@          @;;  @             
           @//  ///@  @  ;;@        @;;;;;@             
           @///////@  @;;;;;@@     @;;;;@@              
           @///////@   @@;;;;;@  @@;;;;@                
            @/////@      @/;;;;@@;;;;;@                 
             @///@   @@@   @;;;;;;;;;@                  
              @@@@  @///@   /@;;;;;@@                   
               @;@ @/  //@    @;;;@                     
           @@@ @;;@//  ///@   @;;;@                     
          @///@ @;@///////@ @@;@;;@@                    
         @/  //@@;@///////@@;;;@;;@;@@    @@@           
        @//  ///@;;@/////@@ ; ;/;;;;;;@  @///@          
        @///////@ ; @///@@ ; ; ;;;;;;;@ @/  //@         
        @///////@; ;;@@@ @; ; ;;;;;;;;;@//  ///@        
         @/////@; ; @     @;;;;;;;;@;;;@///////@        
          @///@ @@;;@     @;;@;;;;;;;;;@///////@        
           @@@    @;;@    @;;;;;;;;;;;;@@/////@   @@@   
                  @;;@    @;;;;;;   @;;@ @///@   @///@  
                  @;;;@   @;@    ;;;;;;@  @@@@  @/  //@ 
                   @;;;@@@;;;;;;;;;;;;;@   @;@ @//  ///@
                    @;;;;@;;;;;;;;;;;;@    @;@@@///////@
                     @;;;@;;;;;;;;;;;;@   @ ; ;@///////@
                      @;@;; ;;;;;;;;;;@   @; ;;;@/////@ 
                      @;@;  ;;;;;;;;;@@@@@;;@@@;;@///@  
                       @;; ;;;;;; ;;;;;;;;;@///@@ @@@   
                       @;  ;;;;;  ;;;;;;@@@/  //@       
                      @;; ;;;;;; ;;;@@@@ @//  ///@      
                      @;;;;;;;;;;;;;@    @///////@      
                     @;;;;;;  ;;;;;@     @///////@      
                     @;;;;;   ;;;;@       @/////@       
                    @;;;;;;  ;;;;;@        @///@        
                    @;;;;;;;;;;;;@          @@@         
                    @;;;;;;;;;;;;@                      
                   @;;; ;;;;;;;;@                       
                 /@@;;   ;;;;;;;@                       
                /;;@;;   ;;;;;;;@                       
               /  ;;;;   ;;;;;;;@                       
               @  ;@;;; ;;;;;@;;;@                      
               @;;;@;;;;;;;;@ ;;;@                      
                @;;@;;;;;;;;@;;;;;@                     
                @@;;@;;;;;;;;@;;;;;@@@@@                
             @@@;;@;;@@;;;;;;;@@@;;;; ; @@              
            @  ;;;;;;;;@@@@@@@   @;;;; ; ;@             
           @;;;;;;;;;@@           @;;;;;;;@             
            @;;;;;;@@              @@;;;;;@             
             @@@@@@                  @@@@@'
         else
             echo "a weird tree";
         fi
}

alias mazes="~/.maze/run.sh"
alias downloadmoreram="sudo sync && sudo sysctl -w vm.drop_caches=3"
alias up="cd .."
# }}}

export NVM_DIR="/home/yicheng-wang/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:~/android-studio/bin

alias eclipse-neon="sudo /opt/eclipse-neon/eclipse/eclipse"
alias mendely="/opt/mendeleydesktop/bin/mendeleydesktop"
alias panalyze="python ~/INFORMS/analyzer.py"
alias g++11="g++ -std=c++11 "
