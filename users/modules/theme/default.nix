{  pkgs, ... } :
{
  gtk.theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome.gnome-themes-extra;
  };

  dconf.settings = {
      "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
      };
  };

  qt.enable = true;
  qt.platformTheme.name = "gtk";
  qt.style.name = "adwaita-dark";
  qt.style.package = pkgs.adwaita-qt;
}
