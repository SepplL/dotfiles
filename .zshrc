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
zinit wait lucid for \
    atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
        zdharma-continuum/fast-syntax-highlighting \
    blockf \
        zsh-users/zsh-completions \
    atload"!_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \

# old syntax highlighting - try faster startup
# zsh-users/zsh-syntax-highlighting \
zinit wait lucid light-mode for \
    Aloxaf/fzf-tab \
    redxtech/zsh-kitty \

# zinit wait lucid load for \
#     zdharma-continuum/zinit-annex-as-monitor \
#     zdharma-continuum/zinit-annex-bin-gem-node \
#     zdharma-continuum/zinit-annex-patch-dl \
#     zdharma-continuum/zinit-annex-rust \

# old settings from OMZ
zinit snippet OMZP::git
zinit snippet OMZL::git.zsh
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit snippet OMZP::git-extras
zinit snippet OMZP::pylint
zinit snippet OMZP::python
zinit snippet OMZP::vim-interaction
zinit snippet OMZP::vagrant

# prompt pure zsh
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

# prompt starship - previouly used alternative
# ; ./starship completions zsh > _starship" \ -- use this for starship completions
# zinit ice as"command" from"gh-r" \
#           atclone"./starship init zsh > init.zsh" \
#           atpull"%atclone" src"init.zsh"
# zinit light starship/starship

autoload -U compinit; compinit
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

export PATH="$HOME/.local/texlive/2024/bin/x86_64-linux:$PATH"

# toolbox homepage
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

export VISUAL=nvim
export EDITOR=nvim

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

source ~/.zsh/evals.zsh
