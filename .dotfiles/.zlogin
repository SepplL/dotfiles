# path and mamba variables for environment
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

# micromamba autocompletion
eval "$($MAMBA_EXE shell hook --shell zsh --root-prefix $MAMBA_ROOT_PREFIX 2> /dev/null)"
# eval "$(micromamba shell hook)"

# toolbox homepage tool
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"

# further path modifications
# path=("$HOME/.local/bin" $path)
path=("$HOME/.local/texlive/2025/bin/x86_64-linux" $path)  # prepend
path+=("$GEM_HOME/bin")  # append

export VISUAL=nvim
export EDITOR=nvim

# evals and shell variables
eval "$(ssh-agent -s)"

# fzf and zoxide for search and feature rich cd alternative
eval "$(fzf --zsh)"
eval "$(zoxide init zsh --cmd cd)"

# tailscale autocompletion
eval "$(tailscale completion zsh)"
