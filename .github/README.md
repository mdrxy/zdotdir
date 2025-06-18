# zdotdir

## What's included

A sample [antidote](https://github.com/mattmc3/antidote) `.zsh_plugins.txt` file that bundles plugins with the following plugin provided features:
- [Autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [History substring searching](https://github.com/zsh-users/zsh-history-substring-search)
- [Syntax highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting)
- <kbd>TAB</kbd> completions
- The popular [Powerlevel10k prompt](https://github.com/romkatv/powerlevel10k)
- A few goodies from [Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh)
- A `functions` directory for lazy-loaded functions
- Lots of [helpful plugins](https://github.com/unixorn/awesome-zsh-plugins)!
- And much more, all without compromising shell speed :rocket:

## Installation

Clone this project to `$ZDOTDIR`, and then make `~/.zshenv` source `$ZDOTDIR/.zshenv`.

Run from `~`:
```zsh
# clone this project
ZDOTDIR=~/.config/zsh
git clone https://github.com/mdrxy/zdotdir $ZDOTDIR

# source the .zshenv from ZDOTDIR
[[ -f ~/.zshenv ]] && mv -f ~/.zshenv ~/.zshenv.bak
echo ". $ZDOTDIR/.zshenv" > ~/.zshenv

# install omz
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
ZSH="$ZDOTDIR/omz" sh install.sh
```
