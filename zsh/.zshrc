function git_branch_name() {
    local branch
    if [[ -n $GIT_BRANCH_CACHE ]]; then
        echo "$GIT_BRANCH_CACHE"
        return
    fi
    branch=$(git symbolic-ref --short HEAD 2> /dev/null)
    if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
        GIT_BRANCH_CACHE="($branch*) "
    elif [[ -n $branch ]]; then
        GIT_BRANCH_CACHE="($branch) "
    fi
    echo "$GIT_BRANCH_CACHE"
}
setopt prompt_subst

function get_battery_level() {
    if [[ "$(cat /sys/class/power_supply/BAT1/status)" == "Charging" ]]; then
        echo "\e[32mC$(cat /sys/class/power_supply/BAT1/capacity)%%\e[0m"
    else
        echo "\e[31m$(cat /sys/class/power_supply/BAT1/capacity)%%\e[0m"
    fi
}

function set-long-prompt() {
    PROMPT=$'%* %F{yellow}%{\e[3m%}${(%):-%~}%{\e[23m%} %F{cyan}$(git_branch_name)\n%F{magenta}%Bλ%%%b%f '
}
precmd_functions+=(set-long-prompt)

function set-short-prompt() {
    if [[ $PROMPT != '%# ' ]]; then
        PROMPT='%B%#%b '
        zle .reset-prompt
    fi
}

function zle-line-finish() {
    set-short-prompt
}
zle -N zle-line-finish

function trap-interrupt() {
    set-short-prompt
    return 130
}
trap trap-interrupt INT

# PROMPT=$'%T %F{green}%{\e[3m%}${(%):-%~}%{\e[23m%} %F{cyan}$(git_branch_name)%f \n%F{magenta}%Bλ:%b%f '

# XDG base directories.
export XDG_CACHE_HOME="$HOME/.cache"
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
###Golang path
export GOPATH=$HOME/.go
export PATH=$PATH:$(go env GOPATH)/bin
###Local bin path
export PATH="$HOME/.local/bin:$PATH"
###Rustup path
export PATH="$HOME/.cargo/bin:$PATH"
###Nodejs path
export PATH="/bin/node:$PATH"
###Mason path
export PATH="$HOME/.local/share/nvim/mason/bin/:$PATH"
###Bob path
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
###Deno path
export DENO_INSTALL="/home/dimitris/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

### Editor variables
export EDITOR="nvim"
export VISUAL="nvim"
export SUDO_EDITOR="vim"
### Terminal 
export TERMINAL="st"
export TERMINAL_PROG="st"
### Browser
export BROWSER="firefox"
### FZF variables
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"

###history config
export HISTFILE="$XDG_STATE_HOME"/zsh/zsh_history
# How many commands zsh will load to memory.
export HISTSIZE=2000
# How many commands history will save on file.
export SAVEHIST=2000
# History won't save duplicates.
setopt HIST_IGNORE_ALL_DUPS
# History won't show duplicates on search.
setopt HIST_FIND_NO_DUPS
#history will display the time of the command
setopt EXTENDED_HISTORY

#aliases
#system aliases
alias cal="cal -m"
#nvim aliases
alias vi="nvim"
# alias nv="nvim"
alias vi-swap="cd ~/.local/state/nvim/swap/"
#directories
alias doc="cd ~/Documents/"
alias sem="cd ~/Documents/fsemester/"
alias dudir="du -h -s */ | sort -h -r"
#git aliases
alias gcl="git clone"
#bat aliases to integrate with other programs
alias fzf="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

#binds for moving arround ms based
bindkey "^[[1;5C" forward-word #Control+->
bindkey "^[[1;5D" backward-word #Control+<-
bindkey "^X" kill-word
bindkey -s "^F" 'fzf^M'
bindkey "^P" up-line-or-history

# chmod +x
cxx(){
    echo "$1"
    if [ -z "$1" ]
    then
        echo "No argument supplied"
    else
        chmod +x "$1"
        echo "The $1 is now executable"
    fi
}

# mkdir and cd
mkcd() {
    if [ -z "$1" ]
    then
        echo "No argument supplied"
    else
        mkdir -p "$1" && cd "$1" || exit
    fi
}

# cd and ls
cl() {
    if [ -z "$1" ]
    then
        echo "No argument supplied"
    else
        cd "$1" && ls
    fi
}

# set the location for plugins
export ZSH_PLUGINS="$XDG_DATA_HOME/zsh/plugins"

# check if the directory exists
if [ -d "$ZSH_PLUGINS" ]; then
  source "$ZSH_PLUGINS"/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source "$ZSH_PLUGINS"/zsh-autosuggestions/zsh-autosuggestions.zsh
  source "$ZSH_PLUGINS"/zsh-autocomplete/zsh-autocomplete.plugin.zsh
  source "$ZSH_PLUGINS"/zsh-autopair/autopair.zsh
  source "$ZSH_PLUGINS"/zsh-fzf-history-search/zsh-fzf-history-search.zsh
fi


###zoxide for smarter navigation
eval "$(zoxide init zsh)"

################################################################################
#Script to install the plugins
#
#!/bin/env sh
#
# ZSH_PLUGINS=~/.local/share/zsh/plugins
#
# # chech is the directory exists
# if [ -d "$ZSH_PLUGINS" ]; then
# 	echo "Directory exists"
# else
# 	# make the directory
# 	mkdir -p "$ZSH_PLUGINS"
# fi
#
# # clone to ZSH_PLUGINS directory
# cd "$ZSH_PLUGINS" || exit
#
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
# echo "Highlighting installed"
# git clone https://github.com/joshskidmore/zsh-fzf-history-search.git
# echo "FZF history search installed"
# git clone https://github.com/zsh-users/zsh-autosuggestions.git
# echo "Autosuggestions installed"
# git clone https://github.com/hlissner/zsh-autopair.git
# echo "Autopair installed"
# git clone https://github.com/chrissicool/zsh-256color.git
# echo "256color installed"
# git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git
# echo "Autocomplete installed"
# echo "All plugins installed"
# echo "Please reload your shell"
