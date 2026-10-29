#!/bin/bash

if [ "$#" -gt 1 ]; then
    echo "Uso: $0 [archivo]" >&2
    exit 1
fi

archivo="${1:-/etc/login.defs}"

if [ ! -f "$archivo" ]; then
    echo "Error: el fichero '$archivo' no existe." >&2
    exit 1
fi

total=0
utiles=0

while  read -r linea; do
    totales=$((totales + 1))

    if [[ -z "$linea" ]] || [[ "$linea" =~ ^# ]]; then
        continue
    fi

    echo "$linea"
    utiles=$((utiles + 1))
done < "$archivo"

echo "----"
echo "Líneas totales: $total"
echo "Líneas útiles: $utiles"

