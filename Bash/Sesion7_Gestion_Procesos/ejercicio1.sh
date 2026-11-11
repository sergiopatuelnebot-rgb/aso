#!/bin/bash

LOG_FILE="$HOME/gestion_procesos.log"

validar_pid() {
    local pid="$1"
    if [[ "$pid" =~ ^[0-9]+$ ]] && ps -p "$pid" &>/dev/null; then
        return 0
    else
        return 1
    fi
}

listar_usuario(){
    read -p "Dime un nombre de usuario: " usuario
    if id "$usuario" &>/dev/null; then
        echo "Mostrando procesos del usuario $usuario:"
        ps -u "$usuario" -f
    else
        echo "El usuario $usuario no existe."
    fi
}

buscar_proceso(){
    read -p "Dime un nombre de proceso: " nombre
    local resultados
    resultados=$(ps -eo pid,user,%cpu,comm | grep -i "$nombre" | grep -v grep)

    if [ -n "$resultados" ]; then
        echo "PID   USER     %CPU  COMMAND"
        echo "$resultados"
    else
        echo "No hay ningún proceso que coincida con $nombre"
    fi
}

top_cpu(){
    local n="${1:-5}"
    
    if ! [[ "$n" =~ ^[0-9]+$ ]]; then
        read -p "Dime el número de procesos que quieres que se te muestre con más uso: " n
    fi

    echo "Mostrando los $n procesos que más CPU consumen:"
    ps aux --sort=-%cpu | head -n $((n + 1))
}

cambiar_prioridad(){
    read -p "PID: " pid
    
    if ! validar_pid "$pid"; then
        echo "El PID $pid no existe o no es válido."
        return 1
    fi

    read -p "Nuevo valor nice (-20 a 19): " val

    if [ "$EUID" -eq 0 ]; then
        if [ "$val" -lt -20 ] || [ "$val" -gt 19 ]; then
            echo "Error: El valor debe estar entre -20 y 19."
            return 1
        fi
    else
        if [ "$val" -lt 0 ] || [ "$val" -gt 19 ]; then
            echo "Error: el valor debe estar entre 0 y 19"
            return 1
        fi
    fi

    local comando
    comando=$(ps -p "$pid" -o comm=)

    if renice "$val" -p "$pid" &>/dev/null; then
        echo "Se ha cambiado la prioridad"
        echo "$(date '+%Y-%m-%d %H:%M:%S') - renice $val - $pid - $comando" >> "$LOG_FILE"
    else
        echo "Error al aplicar renice (comprueba tus permisos sobre este proceso)."
        return 1
    fi
}

finalizar_proceso(){
    read -p "PID: " pid

    if ! validar_pid "$pid"; then
        echo "El PID $pid no existe o no es válido."
        return 1
    fi

    local comando
    comando=$(ps -p "$pid" -o comm=)

    read -p "¿Finalizar $pid ($comando)? (s/n): " confirmacion

    if [[ "$confirmacion" =~ ^[sS]$ ]]; then
        kill -SIGTERM "$pid" 2>/dev/null
        
        sleep 3

        if ps -p "$pid" &>/dev/null; then
            kill -SIGKILL "$pid" 2>/dev/null
            echo "Proceso $pid finalizado con SIGKILL"
            echo "$(date '+%Y-%m-%d %H:%M:%S') - SIGKILL - $pid - $comando" >> "$LOG_FILE"
        else
            echo "Proceso $pid finalizado con SIGTERM"
            echo "$(date '+%Y-%m-%d %H:%M:%S') - SIGTERM - $pid - $comando" >> "$LOG_FILE"
        fi
    else
        echo "Operación cancelada."
    fi
}

menu(){
    local op=0

    while [ "$op" -ne 6 ]; do
        echo ""
        echo "===== GESTIÓN DE PROCESOS ====="
        echo "1) Listar los procesos de un usuario"
        echo "2) Buscar un proceso por nombre"
        echo "3) Mostrar los N procesos que más CPU consumen"
        echo "4) Cambiar la prioridad de un proceso"
        echo "5) Finalizar un proceso"
        echo "6) Salir"
        read -p "Opción: " op

        case $op in
            1)
                listar_usuario
                sleep 2
                ;;
            2)
                buscar_proceso
                sleep 2
                ;;
            3)
                top_cpu
                sleep 2
                ;;
            4)
                cambiar_prioridad
                sleep 2
                ;;
            5)
                finalizar_proceso
                sleep 2
                ;;
            6)
                echo "Saliendo..."
                exit 0
                ;;
            *)
                echo "Opción no válida. Por favor, elige un número del 1 al 6."
                sleep 2
                ;;
        esac
    done
}

menu