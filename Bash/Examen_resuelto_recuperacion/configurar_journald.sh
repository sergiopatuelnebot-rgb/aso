#!/bin/bash

fichero="$1"

mb=$2

sinceros='^[1-9][0-9]*$'


if [[ $# -eq 2 ]]; then

        if [[ -e "$fichero" && -w "$fichero" ]]; then

            if [[ $mb =~ $sinceros ]]; then

                if [[ $mb -le 4096 ]]; then

                    sed -i.bak -E "s/^#?Storage=.*/Storage=persistent/" "$fichero"
                    sed -i -E "s/^#?Compress=.*/Compress=yes/" "$fichero"
                    sed -i -E "s/^#?SystemMaxUse=.*/SystemMaxUse=${mb}M/" "$fichero"

                    grep -vE '^(#|$)' "$fichero"

                else

                echo "$mb tiene que ser menor o igual que 4096mb"
                exit 1

                fi

            else

            echo "$mb debe ser un número válido sin ceros a la izquierda"
            exit 1

            fi

        else

        echo "No existe o no se puede modificar el fichero $fichero"
        exit 1

        fi


else

echo "Uso: $0 <fichero_configuracion> <tamano_MB>"
exit 1

fi