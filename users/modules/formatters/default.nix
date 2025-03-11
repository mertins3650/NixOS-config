{ pkgs, ... }:
{

  home.packages= with pkgs; [
    prettierd
    ruff
    stylua
  ];
}
