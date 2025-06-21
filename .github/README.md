# zdotdir

## What's included

An [antidote](https://github.com/mattmc3/antidote) `.zsh_plugins.txt` file that includes my preferred plugins, frameworks, and aliases.

- Oh-My-Zsh, with plugins:
  - colored-man-pages
  - copybuffer
  - copyfile
  - copypath
  - extract
  - git
  - python
  - brew
- powerlevel10k
- zsh-completions
- fast-syntax-highlighting
- zsh-autosuggestions
- zsh-history-substring-search

## Installation

Clone this project to `$ZDOTDIR`, and then make a symlink from `$HOME/.zshenv` to `$ZDOTDIR/.zshenv` (`ln -s $ZDOTDIR/.zshenv $HOME/.zshenv`)

Run from `$HOME`:

```sh
# clone this project
ZDOTDIR=$HOME/.config/zsh
git clone https://github.com/mdrxy/zdotdir $ZDOTDIR

# source the .zshenv from ZDOTDIR
[[ -f $HOME/.zshenv ]] && mv -f $HOME/.zshenv $HOME/.zshenv.bak
ln -s $ZDOTDIR/.zshenv $HOME/.zshenv
```
