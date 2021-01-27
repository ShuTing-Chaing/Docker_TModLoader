FROM debian:stretch-slim

ENV MODS=VANILLA \
    TERRARIA_VER=1353 \
    TMOD_VER=0.11.8

#Install dependencies
RUN apt update \
    && apt -y install wget unzip \
    && mkdir -p ~/.local/share/Terraria/ModLoader/Mods/ModPacks 

RUN ln -s ${HOME}/.local/share/Terraria/ /terraria

WORKDIR /terraria_launcher

#Copy script
COPY run_terraria.sh .

#Allow execution
RUN chmod +x /terraria_launcher/run_terraria.sh

# -----------------------------------
# only port 7777 has to be forwarded
# -----------------------------------
EXPOSE 7777/tcp

WORKDIR /terrariaServer

ENTRYPOINT ["/terraria_launcher/run_terraria.sh"]