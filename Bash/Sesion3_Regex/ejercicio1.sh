if ! [[ $1 =~ ^[0-9]+$ ]]; then
    echo "$1 No es un puerto válido"

elif (( $1 < 1 || $1 > 65535)); then
    echo "$1 Está fuera de rango"

else
    echo "$1 Es un puerto válido"
fi