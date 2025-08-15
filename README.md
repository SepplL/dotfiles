# Dotfiles and work environment

Manage with 'ansible' [link here](https://docs.ansible.com/)

The first iteration is a wayland-river-waybar setup in consistent rose-pine-dawn themes.
- Terminal: ghostty/zsh - zinit
- Editor: Neovim - lazy mason

initial inspiration and credit to [this guide](https://phelipetls.github.io/posts/introduction-to-ansible/)

update and improvement to my previous dotfiles configuration and settings. More complete
installation process.

to run the 'ansible' playbook, execute
''' bash
ansible-playbook --ask-become-pass bootstrap.yml
'''


## to add
- micromamba with environments
- toolbox settings and installation
- potentially build software from source, link code via submodules or clone
- make install process smoother
