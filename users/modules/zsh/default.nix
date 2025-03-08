{ pkgs, ... }:

{
  home.shell = pkgs.zsh;

  programs = {
    zsh = {
        enable = true;
        shellAliases = {
            ls = "eza -1 --group-directories-first --icons";
            cd = "z";
        };
        oh-my-zsh = {
            enable = true;
            theme = "robbyrussell";
            plugins = ["direnv"];
        };
        history.size = 10000;
        history.ignoreAllDups = true;
        history.path = "$HOME/.zsh_history";
    };
  };
}
