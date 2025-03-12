{ pkgs }:

pkgs.writeShellScriptBin "psdocker" ''
  sudo docker run -d --restart unless-stopped -p "127.0.0.1:5432:5432" --name=postgres16 -e POSTGRES_HOST_AUTH_METHOD=trust postgres:16
''
