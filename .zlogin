# toolbox homepage tool
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"

# path modifications
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

# micromamba autocompletion
eval "$($MAMBA_EXE shell hook --shell zsh --root-prefix $MAMBA_ROOT_PREFIX 2> /dev/null)"
# eval "$(micromamba shell hook)"

# tailscale autocompletion
eval "$(tailscale completion zsh)"

# completion mode for kittens
# __kitty_complete
