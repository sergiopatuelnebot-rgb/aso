#!/bin/bash

fichero="$1"

mb=$2

sinceros='^0+'


if [[ $# -eq 2 ]]; then

        if [[ -e "$fichero" && -w "$fichero" ]]; then

            if [[ $mb -le 4096 ]]; then

                if [[ ! $mb =~ $sinceros ]]; then
                cp $fichero $fichero.bak
                echo "Copia del original: $fichero.bak"
                echo "Configuración inicial"
                cat "$fichero.bak"
                sed -i 's/'#'/''/g' $fichero

                else

                echo "$mb no puede llevar 0 a la derecha"

                fi

            else

            echo "$mb tiene que ser menor o igual que 4096mb"

            fi

        else

        echo "No existe o no se puede modificar el fichero $fichero"
        exit 1

        fi


else

echo "Tienen que ser 2 parámetros"
exit 1

fi