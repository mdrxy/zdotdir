# zdotdir

## What's included

A sample antidote `.zsh_plugins.txt` file that bundles plugins with the following plugin provided features:
- [Autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [History substring searching](https://github.com/zsh-users/zsh-history-substring-search)
- [Syntax highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting)
- <kbd>TAB</kbd> completions
- [Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh) full lib and plugins
- A `functions` directory for lazy-loaded functions
- A custom plugins directory so you can add your own plugins

## Installation

Clone this project to `$ZDOTDIR`, make a symlink to `.zshenv`, and install [Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh).

```zsh
# clone this project
ZDOTDIR=~/.config/zsh
git clone https://github.com/mdrxy/zdotdir $ZDOTDIR

# symlink .zshenv
[[ -f ~/.zshenv ]] && mv -f ~/.zshenv ~/.zshenv.bak
ln -s $ZDOTDIR/.zshenv ~/.zshenv

# install omz
ZSH="$ZDOTDIR" sh -c "$(curl -fSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
```
