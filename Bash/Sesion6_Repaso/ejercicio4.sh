#!/bin/bash

ps -u "$USER" -o pid,pcpu,pmem,comm --sort=-pcpu > procesos.txt
total=$(($(wc -l < procesos.txt) - 1))

if [ $# -gt 0 ]; then
    if [[ ! "$1" =~ ^[0-9]+$ ]] || (( $1 <= 0 )); then
        echo "Error: $1 no es un número válido"
        echo 'Ayuda: ps -u "$USER" -o pid,pcpu,pmem,comm --sort=-pcpu'
        exit 1
    else
        head -n $((1 + $1)) procesos.txt
    fi
else
    cat procesos.txt
fi

echo "Procesos de $USER: $total"