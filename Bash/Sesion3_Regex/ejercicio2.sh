#!/bin/bash
re1='\.conf$'
re2='\.bak$'
conf=0
copias=0

for fichero in /etc/*; do
    if [[ $fichero =~ $re1 ]]; then  
    echo $fichero
    conf=$((conf + 1))
    else [[ $fichero =~ $re2 ]];   
    echo $fichero
    copias=$((copias + 1))
    fi
done
echo ""
echo "Configuración: $conf"

echo "Configuración: $copias"
