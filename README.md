nahhhhhhhhh no fucking way this is so high on google results for "cirn os"

# CirnOS
- If there's some proper-ness to it, it's probably @notashelf's work. I thank him for supporting my NixOS journey, although it didn't last long.
- If you want my up-to-date dotfiles (offered separately), see https://github.com/end-4/dots-hyprland
- It's impure but it works
- I am very uncertain about this NixOS config due to my lack of experience. I hopped to CachyOS and this likely won't be updated

# Installation
## Installing the whole system
- Please be advised that this flake includes my hardware configuration
  - I mount my Windows partition with a specific UUID to /mnt/Windows
- So this configuration probably won't work on your device... idk

```bash
git clone https://github.com/end-4/CirnOS.git && cd CirnOS
IMPURITY_PATH=$(pwd) sudo --preserve-env=IMPURITY_PATH nixos-rebuild switch --flake . --impure
```

## Installing only home manager stuff
- Unfortunately I'm not knowledgeable enough to offer that (yet?). Just copy the homes folder and import it or something?

