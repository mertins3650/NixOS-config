{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
  bun
  clang
  gcc
  go
  gopls
  lua
  luajit
  luarocks
  lua-language-server
  nodejs_23
  python314
  rustc
  rust-analyzer
  typescript
  typescript-language-server
  zig
  ];
}
