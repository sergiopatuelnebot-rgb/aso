if [[ -z "$1" ]]; then

echo "No has introducido ningun parámetro"

elif [[ -f $1 ]]; then

sed -e '/^#/d' -e '/^$/d' "$1"

else

echo "No existe el archivo indicado"

fi
