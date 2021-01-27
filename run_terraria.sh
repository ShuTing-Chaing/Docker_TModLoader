#!/bin/sh
install(){
    wget https://github.com/tModLoader/tModLoader/releases/download/v$tmod_version/tModLoader.Linux.v$tmod_version.zip
    wget http://terraria.org/server/terraria-server-$terraria_version.zip
    unzip terraria-server-$terraria_version.zip -d terraria
    rm terraria-server-$terraria_version.zip
    cp terraria/Linux/* ./
    rm -Rf terraria
    unzip tModLoader.Linux.v$tmod_version.zip -d ./
    rm tModLoader.Linux.v$tmod_version.zip
    chmod u+x tModLoaderServer*
}

run(){
    /terrariaServer/tModLoaderServer
}


if  [ ! -f "/terrariaServer/tModLoaderServer" ]; then
    install
fi
run

