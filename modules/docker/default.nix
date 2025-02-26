{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    docker
    docker-compose
    lazydocker
  ];


  virtualisation.docker = {
    enable = true;
    daemon = {
      settings = {
        "log-driver" = "json-file";
        "log-opts" = {
          "max-size" = "10m";
          "max-file" = "3";
        };
      };
    };
  };
}
