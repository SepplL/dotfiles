ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# download zinit if not available yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

# source/load zinit
source "${ZINIT_HOME}/zinit.zsh"

# keybindings for terminal scrolling
source ~/.zsh/key-bindings.zsh

# start config here
# Load a few important annexes, without Turbo
# (this is currently required for annexes)
# turbo quick load all
zinit ice lucid for \
    atload"!zicompinit; zicdreplay" \
    blockf \
        zsh-users/zsh-completions \
        redxtech/zsh-kitty \

zinit lucid for \
    atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
        zdharma-continuum/fast-syntax-highlighting \
        Aloxaf/fzf-tab \
        zsh-users/zsh-autosuggestions \

# if autosuggestions stops working include:
# atload"!_zsh_autosuggest_start" \

# prompt pure zsh
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

# prompt starship - previouly used alternative
# ; ./starship completions zsh > _starship" \ -- use this for starship completions
# zinit ice as"command" from"gh-r" \
#           atclone"./starship init zsh > init.zsh" \
#           atpull"%atclone" src"init.zsh"
# zinit light starship/starship

# old settings from OMZ
zinit for \
    OMZP::git \
    OMZL::git.zsh \
    OMZP::sudo \
    OMZP::command-not-found \
    OMZP::git-extras \
    OMZP::pylint \
    OMZP::python \
    OMZP::vim-interaction \
    OMZP::vagrant \

autoload -Uz compinit; compinit
zinit cdreplay -q

# History
HISTSIZE=5000
HISTFILE=~/.zsh/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

source ~/.zsh/styling.zsh
source ~/.zsh/aliases.zsh

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
export MAMBA_EXE='/home/seppl/.local/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/seppl/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

source ~/.zlogin
