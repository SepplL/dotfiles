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

# start config here
eval $(ssh-agent -s)

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
# turbo quick load all
zinit wait lucid load for \
    atinit"zicompinit; zicdreplay" \
        zsh-users/zsh-syntax-highlighting \
        redxtech/zsh-kitty \
    atload"_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \

zinit wait lucid light-mode for \
    Aloxaf/fzf-tab \
    zsh-users/zsh-completions \

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

# fzf dracula color theme
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# prompt pure zsh
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

# prompt starship
# ; ./starship completions zsh > _starship" \ -- use this for starship completions
# zinit ice as"command" from"gh-r" \
#           atclone"./starship init zsh > init.zsh" \
#           atpull"%atclone" src"init.zsh"
# zinit light starship/starship

# keybindings for terminal scrolling
source ~/.zsh/key-bindings.zsh

autoload -Uz compinit && compinit
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

# Completion settings
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -al --color=always --group-directories-first --icons'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'exa -al --color=always --group-directories-first --icons'

alias ls='exa -al --color=always --group-directories-first --icons'  # preferred listing
alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons'  # tree listing
alias l='exa -lah --color=always --group-directories-first --icons'  # tree listing

alias open='imv '
# include dotfiles repo for maintaining and saving configs
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
# include kitten to ssh - now showing screens correctly
alias kssh="kitten ssh"

# Completion for kitty
# kitty + complete setup zsh | source /dev/stdin

export PATH="$HOME/.local/texlive/2024/bin/x86_64-linux:$PATH"

export VISUAL=nvim
export EDITOR=nvim

# eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/seppl/.local/miniforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/seppl/.local/miniforge/etc/profile.d/conda.sh" ]; then
        . "/home/seppl/.local/miniforge/etc/profile.d/conda.sh"
    else
        export PATH="/home/seppl/.local/miniforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/seppl/.local/miniforge/etc/profile.d/mamba.sh" ]; then
    . "/home/seppl/.local/miniforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<
# mamba deactivate
