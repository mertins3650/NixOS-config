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
  curl
  jq
  git
  gh
  libpng
  protonup
  wget
  home-manager
  qmk
  ];
}
