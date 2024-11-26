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

# fzf dracula color theme
# export FZF_DEFAULT_OPTS="
#     --height=60% 
#     --layout=reverse 
#     --info=inline 
#     --border
#     --margin=1
#     --padding=1
#     --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9
#     --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9
#     --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6
#     --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4
#     "
# fzf rose-pine-dawn color theme
export FZF_DEFAULT_OPTS="
    --height=60% 
    --layout=reverse 
    --info=inline 
    --border
    --margin=1
    --padding=1
    --color=fg:#797593,bg:#faf4ed,hl:#d7827e
    --color=fg+:#575279,bg+:#f2e9e1,hl+:#d7827e
    --color=border:#dfdad9,header:#286983,gutter:#faf4ed
    --color=spinner:#ea9d34,info:#56949f
    --color=pointer:#907aa9,marker:#b4637a,prompt:#797593
    "

# prompt pure zsh
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

# prompt starship
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

# Completion settings
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' menu no

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -al --color=always --group-directories-first --icons'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -al --color=always --group-directories-first --icons'
# zstyle ':fzf-tab:complete:micromamba:*' fzf-preview

alias ls='eza -al --color=always --group-directories-first --icons auto'  # preferred listing
alias la='eza -a --color=always --group-directories-first --icons auto'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons auto'  # long format
alias lt='eza -aT --color=always --group-directories-first --icons auto'  # tree listing
alias l='eza -lah --color=always --group-directories-first --icons auto'  # tree listing

alias open='imv '
# include dotfiles repo for maintaining and saving configs
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
# include kitten to ssh - now showing screens correctly
alias kssh="kitten ssh"
alias kdiff="kitten diff"

# Completion for kitty
# kitty + complete setup zsh | source /dev/stdin

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
eval $(ssh-agent -s)
eval "$(fzf --zsh)"
eval "$(zoxide init zsh --cmd cd)"
# micromamba inclusion:
eval "$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
# eval "$(micromamba shell hook)"
