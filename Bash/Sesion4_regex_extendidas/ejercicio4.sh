#!/bin/bash

passw="$1"


if [[ ${#passw} -ge 12 ]]; then
    mas12="yes"
else
    mas12="no"
fi


if [[ "$passw" =~ [0-9] ]]; then
    dig="yes"
else
    dig="no"
fi


if [[ "$passw" =~ [A-Z] ]]; then
    may="yes"
else
    may="no"
fi


if [[ "$passw" =~ [_.@~·#€] ]]; then
    sim="yes"
else
    sim="no"
fi

if [[ -f /usr/share/dict/words ]] && grep -qxi "$passw" /usr/share/dict/words; then
    dic="no"
else
    dic="yes"
fi

echo "Tiene al menos 12 caracteres: $mas12"
echo "Contiene algún dígito: $dig"
echo "Contiene alguna mayúscula: $may"
echo "Contiene algún símbolo: $sim"
echo "No es una palabra del diccionario: $dic"