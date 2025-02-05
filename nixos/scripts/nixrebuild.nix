{ pkgs }:

pkgs.writeShellScriptBin "nixrebuild" ''
    if [ "$#" -ne 1 ]; then
        echo "Usage: nixrebuild <configuration>"
        exit 1
    fi
    sudo nixos-rebuild switch --flake "$HOME/NixOS-config#$1"
''

