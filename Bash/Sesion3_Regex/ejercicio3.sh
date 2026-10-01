#!/bin/bash

contador=0

while read -r linea; do 

usuario=$(echo "$linea" | cut -d: -f1)

((contador++))

echo "$contador: $usuario"

done < /etc/passwd
