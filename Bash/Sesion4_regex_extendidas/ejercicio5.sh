#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Uso: $0 <direccion_ip>"
    exit 1
fi

IP="$1"

if [[ "$IP" =~ ^127\. ]]; then
    echo "$IP es una dirección loopback"
elif [[ "$IP" =~ ^10\.|^192\.168\.|^172\.(1[6-9]|2[0-9]|3[0-1])\. ]]; then
    echo "$IP es una dirección privada"
else
    echo "$IP es una dirección pública"
fi



# Las expresiones regulares evalúan patrones a nivel de caracteres individuales, 
# por lo que una clase de caracteres tradicional (como [16-31]) no funciona para 
# representar valores numéricos enteros. Para resolverlo en una única expresión 
# regular, se ha desglosado el rango en subpatrones agrupados y separados por el 
# operador de alternativa (|):
# - 1[6-9] valida los números del 16 al 19.
# - 2[0-9] valida los números del 20 al 29.
# - 3[0-1] valida los números del 30 al 31.
# Combinado en el grupo (1[6-9]|2[0-9]|3[0-1]), permite abarcar exactamente todo 
# el rango solicitado de forma precisa.
