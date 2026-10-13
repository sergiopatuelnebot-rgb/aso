if [[ -z "$1" ]]; then

echo "No has introducido ningun parámetro"

elif [[ -f "$1" ]]; then

sed -E 's/([0-9]{1,3}\.){3}[0-9]{1,3}/X.X.X.X/g' "$1"

else

echo "No existe el archivo indicado"

fi


