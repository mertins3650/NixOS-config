{ pkgs }:

pkgs.writeShellScriptBin "dev-commit" ''
    pushd ~/dev
    git add .
    git commit -m 'automated dev commit'
    git push
    popd
''
