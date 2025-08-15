# .bashrc
eval $(ssh-agent -s)

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

export PATH="$HOME/.local/texlive/2024/bin/x86_64-linux:$PATH"
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/seppl/.local/miniforge/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
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

