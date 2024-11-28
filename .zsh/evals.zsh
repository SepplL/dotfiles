eval $(ssh-agent -s)

# fzf and zoxide for search and feature rich cd alternative
eval "$(fzf --zsh)"
eval "$(zoxide init zsh --cmd cd)"

# micromamba autocompletion
eval $($MAMBA_EXE shell hook --shell zsh --root-prefix $MAMBA_ROOT_PREFIX 2> /dev/null)
# eval "$(micromamba shell hook)"

# tailscale autocompletion
eval $(tailscale completion zsh)
