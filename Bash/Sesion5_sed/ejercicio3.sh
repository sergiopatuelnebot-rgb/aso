#!/bin/bash
# anonimizar_log.sh - Genera una copia del registro con las IP sustituidas por X.X.X.X
if [ $# -ne 1 ]; then
echo "Uso: $0 fichero"
exit 1
fi
if [ ! -f "$1" ]; then
echo "Error: el fichero $1 no existe"
exit 1
fi
salida="$1.anonimo"
sed -E 's/([0-9]{1,3}\.){3}[0-9]{1,3}/X.X.X.X/g' "$1" > "$salida"
echo "Fichero anonimizado: $salida"