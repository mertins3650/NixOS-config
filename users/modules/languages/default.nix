{ pkgs, ... }:
{

  home.packages = with pkgs; [
    clang
    bun
    gcc
    go
    lua
    nodejs
    python3
    rustc
    typescript
    zig
  ];
}
