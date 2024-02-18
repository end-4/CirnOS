# CirnOS
- If you want my dotfiles offered separately, they're here: https://github.com/end-4/dots-hyprland
- It's impure but it works
- I am very uncertain about this NixOS config due to my lack of experience. I hopped to CachyOS and this likely won't be updated

# Installation
## Installing the whole system
- Please be advised that this flake includes my hardware configuration
  - I mount my Windows partition with a specific UUID to /mnt/Windows
- So this configuration likely won't work on your device... idk
```bash
git clone https://github.com/end-4/CirnOS.git && cd CirnOS
IMPURITY_PATH=$(pwd) sudo --preserve-env=IMPURITY_PATH nixos-rebuild switch --flake . --impure
```

## Installing only home manager stuff
- Unfortunately I'm not knowledgeable enough to offer that (yet?). Just copy the homes folder and import it or something?

