#!/bin/bash
usuario(){

    nom="$1"
    ape="$2"

    l_nom=$(echo "$nom" | cut -c1-2 | tr 'A-Z' 'a-z')
    l_ape1=$(echo "$ape" | cut -d' ' -f1 | cut -c1-2 | tr 'A-Z' 'a-z')
    l_ape2=$(echo "$ape" | cut -d' ' -f2 | cut -c1 | tr 'A-Z' 'a-z')

    echo "alu${l_nom}${l_ape1}${l_ape2}"
}

mostrar_error() {
    echo "Error: $1"
    echo "Uso: $0 alta | baja identificador"
    exit 1
}

resp=$1

resp2=$2

nombre1='^[A-Za-z]+$'

apellidos1='^[A-Za-z]+ [A-Za-z]+$'

id_regex='^alu[a-z]{5}$'

if [[ $# -gt 2 ]]; then

echo "ERROR: Has introducido mas de dos parámetros"

exit 1

fi 

if [[ $resp =~ 'alta' ]]; then

echo "Has seleccionado alta"

read -p "Nombre (sin tildes): " nombre

    if ! [[ $nombre =~ $nombre1 ]]; then

    echo "Debe de ser una palabra sin tildes, sin espacios y sin símbolos"
    mostrar_error

    fi

read -p "Apellidos (sin tildes): " apellidos

    if ! [[ $apellidos =~ $apellidos1 ]]; then

    echo "Deben de ser dos palabras sin tildes, sin espacios y sin símbolos"
    mostrar_error

    fi

id_generado=$(usuario "$nombre" "$apellidos")

echo "Identificador generado: $id_generado"

    if id "$id_generado" &>/dev/null; then

        mostrar_error "el usuario $id_generado ya existe"

    else

    echo "Para crearlo: sudo useradd -m -s /bin/bash -c '$nombre $apellidos' $id_generado"

    fi

elif [[ $resp =~ 'baja' ]]; then

echo "Has seleccionado baja"

    if [[ -z $2 ]]; then
        
        mostrar_error "Falta el identificador para la baja"
        exit 1
    fi

    if ! [[ $2 =~ $id_regex ]]; then

    echo "No está correctamente escrito, el formato es: aluXXYYZ"
    exit 1

    fi

    if ! id "$2" &>/dev/null; then

    echo "El usuario no existe"
    
    mostrar_error
    
    else

    echo "Para eliminarlo: sudo userdel -r $2"

    fi

else

echo "No has introducido ningun parámetro correcto, o 'alta' o 'baja'"

fi