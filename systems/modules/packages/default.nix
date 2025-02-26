{pkgs, ... }:
{
  programs = {
    zsh = {
      enable= true;
    };
    firefox = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
  gh
  curl
  jq
  git
  libpng
  protonup
  wget
  home-manager
  qmk
  ];
}
