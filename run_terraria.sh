#!/bin/sh
installTerraria(){
    echo "Terraria Server:"
    echo "Downlaoding..." 
    wget -q http://terraria.org/server/terraria-server-$TERRARIA_VER.zip
    echo "Extracting..."
    unzip -qq terraria-server-$TERRARIA_VER.zip -d terraria
    echo "Preparing files..."
    cp -r terraria/$TERRARIA_VER/Linux/* ./
    echo "Updating permissions..."
    chmod +x ./TerrariaServer.bin.x86*
    echo "Cleaning..."
    rm terraria-server-$TERRARIA_VER.zip
    rm -Rf terraria
    echo "Done"
    
}

installTmod(){
    echo ""
    echo "tModLoader:"
    echo "Downlaoding..." 
    wget -q https://github.com/tModLoader/tModLoader/releases/download/v$TMOD_VER/tModLoader.Linux.v$TMOD_VER.zip
    echo "Extracting..."
    unzip -o -qq tModLoader.Linux.v$TMOD_VER.zip -d ./
    echo "Preparing files..."
    echo "Updating permissions..."
    chmod u+x tModLoaderServer*
    chmod +x ./launcher
    echo "Cleaning..."
    rm tModLoader.Linux.v$TMOD_VER.zip
    echo "Done"
}

run(){
    echo ""
    echo "Starting server..."

    if [ "$MODS" = "VANILLA" ]; then
        ARCH=`uname -m`
        /terrariaServer/TerrariaServer.bin.$ARCH
    fi

    if [ "$MODS" = "TMOD" ]; then
        /terrariaServer/tModLoaderServer
    fi
}

if  [ ! -f "/terrariaServer/launcher" ]; then

    installTerraria

    if [ "$MODS" = "TMOD" ]; then
        installTmod
    fi

fi

run