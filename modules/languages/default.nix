{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
  go
  python3
  rustc
  typescript
  zig
  ];
}
