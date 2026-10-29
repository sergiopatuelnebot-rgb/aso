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

buscar_nombre(){
    read -p "Dime un nombre: " nombre

    resultados=$(pgrep -l "$nombre")

    if [ -n "$resultados" ]; then

    echo "Procesos encontrados:"

    echo "$resultados"

    else

    echo "No se ha encontrado ningún proceso con el nombre $nombre"

    fi
}

mostrar_procesos(){
    read -p "Dime el número de procesos que quieres que se te muestre con más uso " n
    ps aux --sort=%cpu | head -$n
}

cambiar_prioridad(){
    read -p "Dime un PID: " pid
    
    if ! ps -p "$pid" &>/dev/null; then
        echo "El PID $pid no existe."
        return 1
    fi

    read -p "Dime un valor entre -20 y 19: " val
    if [ "$EUID" -eq 0 ]; then
        if [ "$val" -lt -20 ] || [ "$val" -gt 19 ]; then
        echo "Error: El valor debe estar entre -20 y 19."
            return 1
        fi
    else
        if [ "$val" -lt 0 ] || [ "val" -gt 19 ]; then
            echo "Si no eres root el valor debe de estar entre 0 y 19."
            return 1
        fi
    fi

    if renice "$val" -p "$pid" &>/dev/null; then
        echo "Se ha cambiado la prioridad"
    else
        echo "Error al aplicar renice (comprueba tus permisos sobre este proceso)."
        return 1
    fi
}

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
    sleep 5
    ;;
    2)
    buscar_nombre
    sleep 5
    ;;
    3)
    mostrar_procesos
    sleep 5
    ;;
    4)
    cambiar_prioridad
    sleep 5
    ;;
esac
done
}


menu

