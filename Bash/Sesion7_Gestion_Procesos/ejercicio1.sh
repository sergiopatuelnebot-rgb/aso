#!/bin/bash
listar_usuario(){
    read -p "Dime una id: " id
    if id "$id" &>/dev/null; then

    echo "Mostrando procesos de $id"

    ps -u "$id" -f

    else

    echo "El usuario $id no existe"

    fi
}

#buscar_nombre(){
#
#}



menu(){
op=0

while [ ! $op -eq 6 ]; do

echo "===== GESTIÓN DE PROCESOS =====
1) Listar los procesos de un usuario
2) Buscar un proceso por nombre
3) Mostrar los N procesos que más CPU consumen
4) Cambiar la prioridad de un proceso
5) Finalizar un proceso
6) Salir"
read -p "Opción: " op

case $op in

    1)
    listar_usuario
    ;;
    2)
    ;;
esac
done
}


menu

