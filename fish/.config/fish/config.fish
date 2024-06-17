if status is-interactive
  bind \cH backward-kill-word
  abbr -a vi nvim
  abbr -a vi-swap "cd $HOME/.local/state/nvim/swap/"
end

set fish_greeting

function pretty_path
  set_color normal;
  set_color -i yellow;
  echo (pwd | sed "s|^$HOME|~|g")
end

function get_branch
  set_color normal;
  set_color grey;
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

# Golang path
set -x GOPATH $HOME/.go
set -x PATH $PATH (go env GOPATH)/bin
# Local bin path
set -x PATH $HOME/.local/bin $PATH
# Rustup path
set -x PATH $HOME/.cargo/bin $PATH
# Nodejs path
set -x PATH /bin/node $PATH
# Mason path
set -x PATH $HOME/.local/share/nvim/mason/bin/ $PATH
# Bob path
set -x PATH $HOME/.local/share/bob/nvim-bin $PATH
# Deno path
set -x DENO_INSTALL $HOME/.deno
set -x PATH $DENO_INSTALL/bin $PATH

set -x EDITOR "nvim"
set -x VISUAL "nvim"
set -x SUDO_EDITOR "vim"
set -x TERMINAL "st"
set -x TERMINAL_PROG "st"
set -x BROWSER "firefox"
set -x FZF_DEFAULT_COMMAND "rg --files --hidden --follow --glob '!.git'"

zoxide init fish | source
