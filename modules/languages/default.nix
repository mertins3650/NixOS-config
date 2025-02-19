{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
  bun
  go
  gopls
  nodejs_23
  python3
  rustc
  rust-analyzer
  typescript
  typescript-language-server
  zig
  ];
}
