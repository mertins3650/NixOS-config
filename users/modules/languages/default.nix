{ pkgs, ... }:
{

  home.packages = with pkgs; [
    bun
    go
    lua
    nodejs
    python3
    rustc
    typescript
    zig
  ];
}
