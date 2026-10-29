if [[ -z "$1" ]]; then

echo "No has introducido ningun parámetro"

elif [[ -f "$1" ]]; then

sed 's/gmail.com/alu.edu.gva.es/; s/hotmail.com/alu.edu.gva.es/' "$1"

else

echo "No existe el archivo indicado"

fi


