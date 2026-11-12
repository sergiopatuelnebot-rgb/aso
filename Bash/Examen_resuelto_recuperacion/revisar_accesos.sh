#!/bin/bash
# No he sabido separar la ip del usuario ni hacer el bucle

fichero="$1"

cont=0
contno=0

usuario='^[a-z]{2,8}$'

ip='^([1-9]{1,3}.){3}[1,9]{1,3}$'

if [[ $# -eq 1 ]]; then

        if [[ -f "$fichero" ]]; then

            while IFS=: read -r us ips; do
    

                if [[ $us =~ $usuario ]]; then

                echo "$us OK"
                ((cont++))

                else

                echo "$us no válido"
                ((contno++))

                fi

                if [[ $ips =~ $ip ]]; then

                echo "$ips OK"
                ((cont++))

                else

                echo "$ips no válida"
                ((contno++))

                fi

                done < $fichero

                echo "------------------"
                echo "Peticiones válidas: $cont"
                echo "Peticiones rechazadas $contno"

        else

        echo "No existe o no se puede leer el fichero $fichero"
        exit 1

        fi


else

echo "Tiene que ser 1 parámetro"
exit 1

fi