# Dotfiles Repository

This repository contains my personal dotfiles. They are managed using [GNU
Stow](https://www.gnu.org/software/stow/), a free, portable, lightweight
symlink farm manager. This allows the dotfiles to be organized in a clean and
structured manner.

## Supported Shells

The dotfiles in this repository support the following shells:

-   Bash
-   Zsh
-   Fish

## Window Manager Configuration

This repository also includes configuration for the
[bspwm](https://github.com/baskerville/bspwm) window manager, a tiling window
manager that represents windows as the leaves of a full binary tree.

Keybindings for bspwm are managed using
[sxhkd](https://github.com/baskerville/sxhkd), a simple X hotkey daemon with a
powerful and compact configuration syntax.

## Showcase

![swappy-20240913-192851](https://github.com/user-attachments/assets/59b566b2-95df-46e7-9136-5df0bfa40a87)

## Installation

To install clone the repo cd into it and run the command:

```sh
stow <folder>
```

Make sure you do not try to install `LICENSE` or `README.md`.

## Structure

The structure of the repo in a tree like representation is as follows:

```
.
├── .gitignore
├── alacritty
│  └── .config
│     └── alacritty
│        └── alacritty.toml
├── bash
│  └── .bashrc
├── bspwm
│  └── .config
│     └── bspwm
│        ├── bspwmrc
│        └── stat.jpg
├── fish
│  └── .config
│     └── fish
│        ├── conf.d
│        ├── config.fish
│        └── functions
│           ├── irg.fish
│           ├── ll.fish
│           └── mkcd.fish
├── git
│  └── .gitconfig
├── helix
│  └── .config
│     └── helix
│        ├── config.toml
│        ├── languages.toml
│        └── themes
│           ├── melange-light.toml
│           └── melange.toml
├── kitty
│  └── .config
│     └── kitty
│        ├── current-theme.conf
│        └── kitty.conf
├── lazygit
│  └── .config
│     └── lazygit
│        └── config.yml
├── LICENSE
├── macchina
│  └── .config
│     └── macchina
│        ├── macchina.toml
│        └── themes
│           └── Hydrogen.toml
├── polybar
│  └── .config
│     └── polybar
│        ├── config.ini
│        └── launch.sh
├── README.md
├── structure.txt
├── sxhkd
│  └── .config
│     └── sxhkd
│        └── sxhkdrc
├── tmux
│  └── .tmux.conf
├── vim
│  └── .vim
│     ├── spell
│     │  ├── .greek.dic.swp
│     │  ├── el.utf-8.add
│     │  ├── el.utf-8.add.spl
│     │  ├── el.utf-8.spl
│     │  ├── el_GR.dic
│     │  └── en_US.dic
│     └── vimrc
├── wezterm
│  └── .config
│     └── wezterm
│        └── wezterm.lua
├── zathura
│  └── .config
│     └── zathura
│        └── zathurarc
└── zsh
   └── .zshrc
```

## LICENSE

Most files are licensed under the LICENSE, except for files that state otherwise.
