#!/bin/bash

forzar_fin(){
    kill -9 "$pid"
}

terminar(){
    kill -15 "$pid"
}


proceso="$1"

nombre='^[a-z0-9]+$'

usuario=$(whoami)

if [[ $# -eq 1 ]]; then

        if [[ $proceso =~ $nombre ]]; then

        pid=$(pgrep -u "$usuario" -d ',' "$proceso")

            if [[ -n $pid ]]; then
            
            ps -p "$pid" -o pid,user,%cpu,comm

            read -p "[f] finalizar, [k] forzar, [n]nada: " opcion

                if [[ $opcion -eq "f" ]]; then
                terminar

                elif [[ $opcion -eq "k" ]]; then
                forzar_fin

                elif [[ $opcion -eq "n" ]]; then

                exit 0

                else

                read -p "[f] finalizar, [k] forzar, [n]nada: " opcion

                fi

            else

            echo "Error: no hay ninún proceso con el nombre $proceso"

            fi

        else

        echo "El proceso tiene que contener mínusculas y numeros"
        exit 1

        fi


else

echo "Tiene que ser 1 parámetro"
exit 1

fi