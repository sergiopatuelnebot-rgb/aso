#!/bin/bash

read -p "Dime el nombre de usuario: " us
cont=1

while [[ $cont -eq 1 ]]; do

    if [[ "$us" =~ ^[a-z][a-z0-9]*$ ]]; then

        if grep -q "^$us:" /etc/passwd; then
        cont=0
        echo "El usuario $us existe"
        
        else

        echo "Creando usuario $us..."
        cont=0
        fi
    else

    echo "No es válido. Debe empezar por minúscula y tener solo minúsculas o dígitos."
    exit 1
    fi
done



