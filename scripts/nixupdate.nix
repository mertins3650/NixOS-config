{ pkgs }:

pkgs.writeShellScriptBin "nixupdate" ''
    nh os flake update
''

