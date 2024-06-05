eval $(ssh-agent -s)

# add zinit
#
#
#

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

autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

export PATH="$HOME/.local/texlive/2024/bin/x86_64-linux:$PATH"

export VISUAL=nvim
export EDITOR=nvim

fpath+=($HOME/.zsh/pure)

autoload -U promptinit; promptinit
prompt pure

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
