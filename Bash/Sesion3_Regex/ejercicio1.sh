if ! [[ $1 =~ ^[0-9]+$ ]]; then
    echo "$1 No es un puerto válido"
    exit 1
elif (( $1 < 1 || $1 > 65535)); then
    echo "$1 Está fuera de rango"
    exit 1
else
    echo "$1 Es un puerto válido"
fi