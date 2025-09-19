# fzf theming:
#
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
#
# fzf rose-pine-dawn color theme
export FZF_DEFAULT_OPTS="
    --height=60% 
    --layout=reverse 
    --info=inline 
    --border
    --margin=1
    --padding=1
    --color=fg:#797593,bg:#f8f0e7,hl:#d7827e
    --color=fg+:#575279,bg+:#f2e9e1,hl+:#d7827e
    --color=border:#dfdad9,header:#286983,gutter:#faf4ed
    --color=spinner:#ea9d34,info:#56949f
    --color=pointer:#907aa9,marker:#b4637a,prompt:#797593
    "
#
# apply same fzf settings to zoxide
_ZO_FZF_OPTS=$FZF_DEFAULT_OPTS


# Completion settings - interactive styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' menu no

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -al --color=always --group-directories-first --icons'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -al --color=always --group-directories-first --icons'
zstyle ':fzf-tab:*' use-fzf-default-opts yes

