# Dotfiles Repository

This repository contains my personal dotfiles. They are managed using [GNU
Stow](https://www.gnu.org/software/stow/), a free, portable, lightweight
symlink farm manager. This allows the dotfiles to be organized in a clean and
structured manner.

## Window Manager Configuration

### X11

This repository also includes configuration for the
[bspwm](https://github.com/baskerville/bspwm) window manager, a tiling window
manager that represents windows as the leaves of a full binary tree.

Keybindings for bspwm are managed using
[sxhkd](https://github.com/baskerville/sxhkd), a simple X hotkey daemon with a
powerful and compact configuration syntax.

### Wayland

On wayland [sway](https://swaywm.org/) is used, with
[autotiling](https://github.com/nwg-piotr/autotiling) script.

> [!IMPORTANT]
> Please note that the tiling script for sway has it own License, please check
> the repository for more info.

## Helix

In this repo there is a configuration for [helix](https://helix-editor.com/),
with custom configuration for [texlab](https://github.com/latex-lsp/texlab) and
[lua-ls](https://luals.github.io/), while leveraging
[efm](https://github.com/mattn/efm-langserver) for linters and formatters.

## Showcase

![swappy-20240913-192851](https://github.com/user-attachments/assets/59b566b2-95df-46e7-9136-5df0bfa40a87)

## Installation

To install clone the repo cd into it and run the command:

```sh
stow <folder>
```

Make sure you do not try to install `LICENSE` or `README.md`.

## LICENSE

Most files are licensed under the LICENSE, except for files that state otherwise.
