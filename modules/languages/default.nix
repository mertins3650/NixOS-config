{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
  bun
  go
  gopls
  nodejs_23
  python314
  rustc
  rust-analyzer
  typescript
  typescript-language-server
  zig
  ];
}
