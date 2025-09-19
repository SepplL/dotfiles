# include custom aliases here

# eza for more feature rich list alternaitve
alias ls='eza -al --color=always --group-directories-first --icons auto'  # preferred listing
alias la='eza -a --color=always --group-directories-first --icons auto'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons auto'  # long format
alias lt='eza -aT --color=always --group-directories-first --icons auto'  # tree listing
alias l='eza -lah --color=always --group-directories-first --icons auto'  # tree listing

alias open='imv '

# include dotfiles repo for maintaining and saving configs
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# kitten aliases for frequently used kittens
alias kssh="kitten ssh"
alias kdiff="kitten diff"

