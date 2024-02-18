# CirnOS
My NixOS config. It uses dotfiles from here: https://github.com/end-4/dots-hyprland
It's impure but it works

# Installation
## Installing the whole thing
```bash
git clone https://github.com/end-4/CirnOS.git && cd CirnOS
IMPURITY_PATH=$(pwd) sudo --preserve-env=IMPURITY_PATH nixos-rebuild switch --flake . --impure
```

## Installing only home manager stuff
- Unfortunately I'm not knowledgeable enough to offer that yet. Just copy the homes folder and import it or something?

