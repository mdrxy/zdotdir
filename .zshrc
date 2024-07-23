#!/bin/zsh
#
# .zshrc - Zsh file loaded on interactive shell sessions.
#

# Required for Homebrew
eval $(/opt/homebrew/bin/brew shellenv)

# Zsh options.
# https://wiki.zshell.dev/community/zsh_guide/roadmap/expansion
setopt extended_glob

# Create a cache folder if it isn't exists
if [ ! -d "$HOME/.cache/zsh" ]; then
    mkdir -p $HOME/.cache/zsh
fi

# Define a custom file for compdump
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump-$HOST-$ZSH_VERSION"

# Autoload functions you might want to use with antidote.
ZFUNCDIR=${ZFUNCDIR:-$ZDOTDIR/functions}
fpath=($ZFUNCDIR $fpath)
autoload -Uz $fpath[1]/*(.:t)

# Source zstyles you might use with antidote.
[[ -e ${ZDOTDIR:-~}/.zstyles ]] && source ${ZDOTDIR:-~}/.zstyles

# Clone antidote if necessary.
[[ -d ${ZDOTDIR:-~}/.antidote ]] ||
  git clone https://github.com/mattmc3/antidote ${ZDOTDIR:-~}/.antidote

# Create an amazing Zsh config using antidote plugins.
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load
