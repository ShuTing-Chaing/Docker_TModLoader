#!/bin/sh
install(){
    wget https://github.com/tModLoader/tModLoader/releases/download/v0.11.8/tModLoader.Linux.v0.11.8.zip
    wget http://terraria.org/server/terraria-server-1353.zip
    unzip terraria-server-1353.zip -d terraria
    rm terraria-server-1353.zip
    cp terraria/Linux/* ./
    rm -Rf terraria
    unzip tModLoader.Linux.v0.11.8.zip -d ./
    rm tModLoader.Linux.v0.11.8.zip
    chmod u+x tModLoaderServer*
}

run(){
    /terrariaServer/tModLoaderServer
}


if  [ ! -f "/terrariaServer/tModLoaderServer" ]; then
    install
fi
run

