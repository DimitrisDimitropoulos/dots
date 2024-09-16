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
stty werase undef
bind '\C-w:unix-filename-rubout'

# XDG base directories.
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export HISTFILE="$XDG_STATE_HOME/bash/.bash_history"
###Local bin path
export PATH="$HOME/.local/bin:$PATH"
###Cargo path
export CARGO_HOME="$XDG_DATA_HOME"/cargo 
export PATH="$CARGO_HOME"/bin:$PATH
###Nodejs path
export PATH="/bin/node:$PATH"
###Mason path
export PATH="$HOME/.local/share/nvim/mason/bin/:$PATH"
###Bob path
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

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
export TERMINAL="kitty"
export TERMINAL_PROG="kitty"
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
if command -v zoxide &>/dev/null; then
	eval "$(zoxide init bash)"
fi
