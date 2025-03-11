{ pkgs, ... }:
{

  home.packages= with pkgs; [
    basedpyright
    gopls
    lua-language-server
    nil
    typescript-language-server
  ];
}
