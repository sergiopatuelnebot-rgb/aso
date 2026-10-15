#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Uso: $0 <contraseña>"
    exit 1
fi

PASSWORD="$1"
SEGURA=true

if [ ${#PASSWORD} -ge 12 ]; then
    echo " Tiene al menos 12 caracteres: sí"
else
    echo " Tiene al menos 12 caracteres: no"
    SEGURA=false
fi

if [[ "$PASSWORD" =~ [0-9] ]]; then
    echo " Contiene algún dígito: sí"
else
    echo " Contiene algún dígito: no"
    SEGURA=false
fi

if [[ "$PASSWORD" =~ [A-Z] ]]; then
    echo " Contiene alguna mayúscula: sí"
else
    echo " Contiene alguna mayúscula: no"
    SEGURA=false
fi

if [[ "$PASSWORD" =~ [^a-zA-Z0-9] ]]; then
    echo " Contiene algún símbolo: sí"
else
    echo " Contiene algún símbolo: no"
    SEGURA=false
fi

DIC_FILE="/usr/share/dict/spanish"
ES_PALABRA_DIC="no"

if [ -f "$DIC_FILE" ]; then
    LOWER_PASS=$(echo "$PASSWORD" | tr '[:upper:]' '[:lower:]')
    if grep -Fxq "$LOWER_PASS" "$DIC_FILE"; then
        ES_PALABRA_DIC="sí"
        SEGURA=false
    fi
fi

echo " No es una palabra del diccionario: $([ "$ES_PALABRA_DIC" = "no" ] && echo "sí" || echo "no")"

if [ "$SEGURA" = true ]; then
    echo "La contraseña es segura"
else
    echo "La contraseña no es segura"
fi

