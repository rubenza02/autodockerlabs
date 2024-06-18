#!/bin/bash

root=$(id -u)
if [ $root -ne 0 ];then
  echo "Necesitas ser root para ejecutar el script"
  exit 1
fi
nombre=$1
test -f $nombre.zip
if [ $? -ne 0 ]; then
echo "La maquina no existe"
else
  echo "Descomprimiendo la maquina $nombre"
  7z x $nombre.zip >/dev/null 
  chmod +x auto_deploy.sh
  ./auto_deploy.sh $nombre.tar  
fi
