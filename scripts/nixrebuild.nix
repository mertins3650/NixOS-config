{ pkgs }:

pkgs.writeShellScriptBin "nixrebuild" ''
    if [ "$#" -ne 1 ]; then
        echo "Usage: nixrebuild <configuration>"
        exit 1
    fi
    sudo nh os switch -H "$1"
''
