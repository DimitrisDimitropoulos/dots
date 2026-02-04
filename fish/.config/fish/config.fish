if status is-interactive
    bind \cH backward-kill-word
    abbr -a vi nvim
    abbr -a vi-swap "cd $HOME/.local/state/nvim/swap/"
end

set fish_greeting

function pretty_path
    set_color normal
    set_color -i yellow
    echo (pwd | sed "s|^$HOME|~|g")
end

function get_branch
    set_color normal
    set_color grey
    if test (git status --untracked-files=no --porcelain 2> /dev/null | wc -l) -eq 0
        set indicator ""
    else
        set indicator "*"
    end
    set branch_name (git rev-parse --abbrev-ref HEAD 2> /dev/null)
    if test "$branch_name" != ""
        echo "($branch_name$indicator)"
    else
        echo ""
    end
end

function fish_prompt
    echo (date '+%T') (pretty_path) (get_branch)
    set_color -io magenta
    echo "λ:"
end

set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_STATE_HOME $HOME/.local/state
set -x XDG_PICTURES_DIR $HOME/Pictures
set -x XDG_DOCUMENTS_DIR $HOME/Documents
set -x GRIM_DEFAULT_DIR $XDG_PICTURES_DIR/Screenshots

# Local bin path
set -x PATH $HOME/.local/bin $PATH
# Cargo path
set -x CARGO_HOME $XDG_DATA_HOME/cargo
set -x PATH $CARGO_HOME/bin $PATH
# Rustup path
set -x RUSTUP_HOME $XDG_DATA_HOME/rustup
# Nodejs path
set -x PATH /bin/node $PATH
set -x NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
# Mason path
set -x PATH $HOME/.local/share/nvim/mason/bin/ $PATH
# Bob path
set -x PATH $HOME/.local/share/bob/nvim-bin $PATH
# Dotnet
set -x DOTNET_CLI_HOME $XDG_DATA_HOME/dotnet
# Flatpaks
set -x PATH /var/lib/flatpak/exports/bin $PATH

if type -q nvim &>/dev/null
    set -x EDITOR nvim
    set -x VISUAL nvim
    set -x SUDO_EDITOR $HOME/.local/share/bob/nvim-bin/nvim
else
    set -x EDITOR vim
    set -x VISUAL vim
    set -x SUDO_EDITOR vim
end

set -x TERMINAL kitty
set -x TERMINAL_PROG kitty
set -x BROWSER firefox
set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --follow --glob '!.git'"
set -gx FZF_DEFAULT_OPTS '--min-height=30 --layout=reverse --cycle --info=inline --no-scrollbar
--preview-window \'right,50%,border-left,<50(down,40%,border-top)\'
--preview \'bat --style=numbers --color=always --line-range :500 {}\'
--bind=alt-k:first
--bind=alt-j:last
--bind=alt-h:toggle-preview
--bind=alt-u:preview-half-page-up 
--bind=alt-d:preview-half-page-down'

zoxide init fish | source
