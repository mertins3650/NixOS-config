{ lib, ... }:

{
  home.activation.startDatabases = lib.hm.dag.entryAfter [ "dockerstart" ] ''
    if ! docker ps --format "{{.Names}}" | grep -q mysql8; then
      docker run -d --restart unless-stopped -p "127.0.0.1:3306:3306" --name=mysql8 \
        -e MYSQL_ROOT_PASSWORD= -e MYSQL_ALLOW_EMPTY_PASSWORD=true mysql:8.4
    fi

    if ! docker ps --format "{{.Names}}" | grep -q postgres16; then
      docker run -d --restart unless-stopped -p "127.0.0.1:5432:5432" --name=postgres16 \
        -e POSTGRES_HOST_AUTH_METHOD=trust postgres:16
    fi
  '';
}

