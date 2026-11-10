#!/bin/bash

error(){
    echo "ERROR, Uso: ./$0 <ruta carpeta remota a copiar>"
}

fecha=$(date +%F_%H-%M)

comprobacion=$(ssh -o BatchMode=yes servidor true)

$copia = $1

if $# = 1; then

if $comprobacion; then

    scp servidor:$1 ~/backups/$1$fecha
    
    ls -l ~/backups/

    echo "$1$fecha Se ha copiado correctamente" > ~/backups/backup.log

else
error
exit 1
fi
fi