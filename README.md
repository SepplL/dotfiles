# Dotfiles and work environment

Manage with `ansible` [link here](https://docs.ansible.com/) for more information.

The first iteration is a wayland-river-waybar setup in consistent rose-pine-dawn themes.
- Terminal: ghostty/zsh - zinit
- Editor: Neovim - lazy + mason

initial inspiration and credit to [this guide](https://phelipetls.github.io/posts/introduction-to-ansible/)

update and improvement to my previous `dotfiles` configuration and settings. More complete
installation process.

to run the `ansible` playbook, execute
``` bash
ansible-playbook --ask-become-pass bootstrap.yml
```

## supported systems

Currently working on both Fedora 42 (last tested) and openSUSE Tumbleweed.
Active: openSUSE. I can't promise a full active support for different distros and package
managers, if the configuration changes with time.

Updates and new features will be tested on my main openSUSE config first. Everything else
follows, if time allows for testing.

## to add
- micromamba with environments
- toolbox settings and installation
- potentially build software from source, link code via submodules or clone
- make install process smoother
- sort different settings and groups toggleable settings, e.g. river + dracula setup
- re-structure directories based on packages/topics? -> less clutter but also more verbose
  than just a `.dotfiles`

