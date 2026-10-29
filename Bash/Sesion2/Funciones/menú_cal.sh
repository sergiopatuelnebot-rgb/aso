#!/bin/bash

op=0

menu () {
    echo "--- Calculadora ---"
    echo "1. Sumar"
    echo "2. Restar"
    echo "3. Multiplicar"
    echo "4. Dividir"
    echo "5. Salir"
    echo "-------------------"
}

sumar () {
    read -p "Introduce numero 1: " num1
    read -p "Introduce numero 2: " num2
    su=$((num1 + num2))
}

restar () {
    read -p "Introduce numero 1: " num1
    read -p "Introduce numero 2: " num2
    re=$((num1 - num2))
}

multiplicar () {
    read -p "Introduce numero 1: " num1
    read -p "Introduce numero 2: " num2
    mu=$((num1 * num2))
}

dividir () {
    read -p "Introduce numero 1: " num1
    read -p "Introduce numero 2: " num2
    
    if [ "$num2" -eq 0 ]; then
        echo "Error: No se puede dividir por cero."
    else
        di=$((num1 / num2))
        echo "Resultado: $di"
    fi
}

while [ "$op" -ne 5 ]; do

menu

    read -p "Introduce la opción: " op

    case $op in
        1)
        sumar
        echo "Resultado: $su"

        ;;
        
        2)
        restar
        echo "Resultado: $re"

        ;;
        
        3)
        multiplicar
        echo "Resultado: $mu"

        ;;
        
        4)
        dividir
        echo "Resultado: $di"

        ;;
        
        5)
        echo "Saliendo de la calculadora..."
        ;;
        
        *)
        echo "Opción inválida. Elige un número del 1 al 5."
        ;;
    esac
    
    echo "" 
done