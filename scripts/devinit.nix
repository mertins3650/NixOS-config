{ pkgs }:

pkgs.writeShellScriptBin "devinit" ''
  pushd ~/NixOS-config/
  git add .
  git commit -m 'automated dev commit'
  git push
  popd
''
