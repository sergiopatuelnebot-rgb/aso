#!/bin/bash

if [ $# -eq 0 ] || [[ ! "$1" =~ ^[0-9]{1,3}$ ]]; then
    echo "Error: ${1:-} no es un número de días válido"
    exit 1
fi

NUEVO_VALOR="$1"
FICHERO="login.defs"

if [ ! -f "$FICHERO" ]; then
    echo "Error: El fichero $FICHERO no existe en la carpeta"
    exit 1
fi

ANTERIOR=$(grep '^PASS_MAX_DAYS' "$FICHERO")

sed -i.bak "s/^PASS_MAX_DAYS.*/PASS_MAX_DAYS $NUEVO_VALOR/" "$FICHERO"

echo "Antes: $ANTERIOR"
echo "Después: PASS_MAX_DAYS $NUEVO_VALOR"