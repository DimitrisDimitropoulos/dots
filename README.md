# Dotfiles Repository

This repository contains my personal dotfiles. They are managed using [GNU
Stow](https://www.gnu.org/software/stow/), a free, portable, lightweight
symlink farm manager. This allows the dotfiles to be organized in a clean and
structured manner.

## Supported Shells

The dotfiles in this repository support the following shells:

- Bash
- Zsh
- Fish

## Window Manager Configuration

This repository also includes configuration for the
[bspwm](https://github.com/baskerville/bspwm) window manager, a tiling window
manager that represents windows as the leaves of a full binary tree. 

Keybindings for bspwm are managed using
[sxhkd](https://github.com/baskerville/sxhkd), a simple X hotkey daemon with a
powerful and compact configuration syntax.

## Installation

To install clone the repo cd into it and run the command:

```
stow <folder>
```
