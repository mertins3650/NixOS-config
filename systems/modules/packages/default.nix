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
  gh
  jq
  git
  libpng
  libsecret
  protonup
  wget
  home-manager
  qmk
  ];
}
