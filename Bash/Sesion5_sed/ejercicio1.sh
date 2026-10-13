if [[ -z "$1" ]]; then

echo "No has introducido ningun parámetro"

elif [[ -f /etc/$1 ]]; then

sed -e '/^#/d' -e '/^$/d' /etc/$1

else

echo "No existe el archivo indicado"

fi
