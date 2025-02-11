{ pkgs }:

pkgs.writeShellScriptBin "devinit" ''
  nixify() {
    if [ ! -e ./.envrc ]; then
      echo "use nix" > .envrc
      direnv allow
    fi
    if [ ! -e shell.nix ]; then
      cat > shell.nix <<'EOF'
  { pkgs ? import <nixpkgs> {} }:

  pkgs.mkShell {
    packages = with pkgs; [

    ];
  }
  EOF
    fi
  }
''
