{pkgs, ... }:
{
  programs = {
    zsh = {
      enable= true;
    };
    firefox = {
      enable = true;
    };
    gnome-disks = {
    enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
  curl
  jq
  feh
  git
  libpng
  libsecret
  protonup
  wget
  home-manager
  qmk
  ];
}
