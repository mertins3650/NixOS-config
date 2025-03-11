{ pkgs, ... }:
{

  home.packages = with pkgs; [
    bun
    go
    nodejs
    python3
    rustc
    typescript
    zig
  ];
}
