#!/bin/bash

rutaab='^/([a-z]+/)*[a-z]+$' 
cont=0
cont_uid=0
res=$1

if [[ ! $# -eq 1 ]]; then

    echo "Demasiados parámetros"
    exit 1
fi

if [[ -z $res ]]; then

    res='/bin/bash' 

fi

if [[ $res =~ $rutaab ]]; then

    while IFS=: read -r usuario pass uid gid info home shell_usuario; do

    if [[ $shell_usuario == $res ]]; then

        echo "$usuario:$uid:$home:$shell_usuario"

        ((cont++))

        if [[ $uid -ge "1000" ]]; then

        ((cont_uid++))

        fi
    fi

    done < /etc/passwd

    echo "---------------------------------"
    echo "Total de cuentas con $res: $cont"
    echo "Cuentas con UID >= 1000: $cont_uid"

else

    echo "Mal"

fi