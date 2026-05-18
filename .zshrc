#
# .zshrc - Zsh file loaded on interactive shell sessions.
#
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -f "${ZDOTDIR:-$HOME}/.env" ]]; then
    set -a  # automatically export all variables
    source "${ZDOTDIR:-$HOME}/.env"
    set +a  # stop auto-exporting
fi

# Disable less history file
export LESSHISTFILE=/dev/null

# Skip compaudit security checks for faster startup
export ZSH_DISABLE_COMPFIX=true
export DISABLE_COMPFIX=true  # Alternative OMZ variable

# Custom location for compdump
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump-$HOST-$ZSH_VERSION"


# Zsh options.

# History command configuration (commented out: ALREADY SET BY OMZ I think)
# setopt extended_history       # record timestamp of command in HISTFILE
# setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
# setopt hist_ignore_dups       # ignore duplicated commands history list
# setopt hist_ignore_space      # ignore commands that start with space
# setopt hist_verify            # show command with history expansion to user before running it
# setopt share_history          # share command history data
setopt hist_reduce_blanks       # remove superfluous blanks from history
setopt hist_save_no_dups        # don't write duplicate entries in the history file
setopt hist_find_no_dups        # don't display lines previously found
setopt globdots                 # include dotfiles in tab completion

# Create a cache folder if it isn't exists
if [ ! -d "$HOME/.cache/zsh" ]; then
    mkdir -p $HOME/.cache/zsh
fi

# Autoload functions to use with antidote
ZFUNCDIR=${ZDOTDIR:-$HOME}/.zfunctions
fpath=($ZFUNCDIR $fpath)
autoload -Uz $ZFUNCDIR/*(.:t)

# zstyles
[[ ! -f ${ZDOTDIR:-$HOME}/.zstyles ]] || source ${ZDOTDIR:-$HOME}/.zstyles

# Clone antidote if necessary (should only happen if it is mistakenly removed)
[[ -d ${ZDOTDIR:-$HOME}/.antidote ]] ||
  git clone https://github.com/mattmc3/antidote ${ZDOTDIR:-$HOME}/.antidote

# OMZ's theme-and-appearance.zsh was removed from .zsh_plugins.txt because it
# forks subprocesses (test-ls-args) to probe ls color support at startup (~4ms).
# On macOS the answer is always `ls -G`, so we hardcode it. The other things
# that file provides (colors autoload, prompt_subst, ZSH_THEME_* vars) are
# unused since Powerlevel10k handles its own prompt setup.
export LSCOLORS="Gxfxcxdxbxegedabagacad"
alias ls='ls -G'

source ${ZDOTDIR:-$HOME}/.antidote/antidote.zsh
antidote load

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"


zstyle ':omz:update' mode disabled # Disable automatic updates for faster startup
# oh-my-zsh loaded via antidote plugins
# source $ZSH/oh-my-zsh.sh

# Compinit handled by use-omz plugin via antidote
# Skip manual compinit to avoid duplication


eval "$(mise activate zsh)"

zsh-defer eval "$(fnm env --use-on-cd --shell zsh --log-level quiet)"


# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ${ZDOTDIR:-$HOME}/.p10k.zsh ]] || source ${ZDOTDIR-$HOME}/.p10k.zsh


# Ruby - lazy loaded
# source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
# source /opt/homebrew/opt/chruby/share/chruby/auto.sh
# chruby ruby-3.4.1

# Auto-activate virtual environments when changing directories.
# Walks from $PWD up to / looking for .venv/bin/activate.
#
# Performance notes:
#   - Uses ${dir%/*} instead of $(dirname "$dir") to avoid forking a
#     subprocess on every loop iteration (~21ms → ~0ms).
#     ${dir:-/} handles the /foo edge case where %/* yields empty string.
#   - Only hooked via chpwd (not a cd() wrapper). chpwd is a built-in zsh
#     hook that fires on cd, pushd, popd, and auto_cd, so a cd() wrapper
#     would just double-call auto_venv and break pushd/popd triggering.
#   - Startup call is deferred via zsh-defer so the prompt appears
#     immediately; the venv activates a moment later.
function auto_venv() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        deactivate 2>/dev/null
    fi

    local dir="$PWD"
    while [[ "$dir" != "/" ]]; do
        if [[ -f "$dir/.venv/bin/activate" ]]; then
            source "$dir/.venv/bin/activate" >/dev/null 2>&1
            return
        fi
        dir=${dir%/*}
        dir=${dir:-/}
    done
}

function chpwd() {
    auto_venv
}

zsh-defer auto_venv
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# bun completions (deferred for faster startup)
zsh-defer source "/Users/mdrxy/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"





