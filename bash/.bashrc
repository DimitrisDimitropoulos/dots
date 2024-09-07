# .bashrc

function git_branch_name() {
	local branch
	branch=$(git symbolic-ref --short HEAD 2>/dev/null)
	if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
		echo "($branch*)"
	elif [[ -n $branch ]]; then
		echo "($branch)"
	fi
}
PS1='\t \[\e[3;33m\]\w\[\e[0m\] \[\e[36m\]$(git_branch_name)\[\e[0m\] \n\[\e[1;35m\]λ:\[\e[0m\]'

alias vi=nvim

# XDG base directories.
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export HISTFILE="$XDG_STATE_HOME/bash/.bash_history"
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
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

### Editor variables
if command -v nvim &>/dev/null; then
	export EDITOR="nvim"
	export VISUAL="nvim"
else
	export EDITOR="vim"
	export VISUAL="vim"
fi
export SUDO_EDITOR="vim"
### Terminal
export TERMINAL="st"
export TERMINAL_PROG="st"
### Browser
export BROWSER="firefox"
### FZF variables
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
export GRIM_DEFAULT_DIR="$XDG_PICTURES_DIR/Screenshots"

### Set SHELL to fish
if command -v fish &>/dev/null; then
	export SHELL="/bin/fish"
else
	echo "Fish shell not found"
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ $HOME/.local/bin:$HOME/bin: ]]; then
	PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
eval "$(zoxide init bash)"
