#!/bin/bash

if [[ $1 = ^172\. ]]; then
    echo "$1 es una dirección loopback"
elif [[ "$1" =~ ^(10\.|192\.168\.|172\.(1[6-9]|2[0-9]|3[0-1])\.) ]]; then
    echo "$1 es una dirección privada"
else
    echo "$1 es una dirección pública"
fi

# El rango de 172.16 a 172.31 no se puede escribir con una única clase de caracteres (como [16-31]) 
# porque las expresiones regulares evalúan caracteres individuales de uno en uno, no valores numéricos. 
# Para resolverlo dentro de una sola expresión regular, he utilizado '|'.
# que divide el rango de forma lógica en tres partes:
#   - 16 a 19: (1[6-9])
#   - 20 a 29: (2[0-9])
#   - 30 a 31: (3[0-1])