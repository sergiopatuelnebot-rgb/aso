#!/bin/bash

if [[ $1 =~ ^[a-z0-9.-_]+@edu.gva.es$ ]]; then

echo "$1 Es de profesorado"

elif [[ $1 =~ ^[a-z0-9.-_]+@alu.edu.gva.es$ ]]; then

echo "$1 Es de alumnado"

else 

echo "$1 No es una cuenta educativa"

fi