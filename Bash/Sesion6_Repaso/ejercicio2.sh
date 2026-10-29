#!/bin/bash

fecha(){
    date +%Y%m%d-%H%M%S
}

fecha1(){
    date +%H:%M:%S
}

registrar(){
    local mensaje=$1
    echo "$mensaje"
    logger -t aso-backup "$mensaje"
}

destino=$1
maxcopias=$2
origen="/home/serpatneb/aso/Bash"

if [[ -z $destino ]]; then
    destino=/var/backups
fi

if [[ -z $maxcopias ]]; then
    maxcopias=7
fi

if [[ -d $destino ]]; then

    if [[ $maxcopias -gt 0 ]]; then

        fecha=$(fecha)
        minutos=$(fecha1)
        nombre_archivo="$destino/backup-bash-$fecha.tar.gz"

        tar -czf "$nombre_archivo" "$origen" 2>/dev/null

        if [[ $? -eq 0 ]]; then
            registrar "$minutos: Copia creada: $nombre_archivo"
            
            num_copias=0
            for archivo in "$destino"/*; do
                if [[ -f "$archivo" ]]; then
                    nombre_base=$(basename "$archivo")
                    if [[ $nombre_base =~ ^backup-bash-[0-9]{8}-[0-9]{6}\.tar\.gz$ ]]; then
                        ((num_copias++))
                    fi
                fi
            done

            if [[ $num_copias -gt $maxcopias ]]; then
                registrar "$(fecha1): Aviso: Hay $num_copias copias, que supera el máximo recomendado de $maxcopias."
            fi

            exit 0
        else 
            registrar "$(fecha1): Error al crear la copia de seguridad."
            exit 1
        fi

    else
        registrar "$(fecha1): Error: el número máximo de copias debe ser mayor que 0"
        exit 1
    fi

else
    registrar "$(fecha1): Error: Debe existir la carpeta destino ($destino)"
    exit 1
fi