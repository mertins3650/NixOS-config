{ pkgs, ... }:
{

  home.packages = with pkgs; [
    bun
    clang
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
