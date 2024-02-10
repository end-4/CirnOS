function fish_prompt
  set_color cyan; echo (pwd)
  set_color green; echo '> '
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
end

alias nrb='IMPURITY_PATH=$(pwd) sudo --preserve-env=IMPURITY_PATH nixos-rebuild switch --flake . --impure'

starship init fish | source
if test -f ~/.cache/ags/user/colorschemes/sequences
    cat ~/.cache/ags/user/colorschemes/sequences
end

