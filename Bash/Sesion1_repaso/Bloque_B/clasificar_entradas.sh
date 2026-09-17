for entrada in ~/prueba_bash/*; do
    if [[ -f "$entrada" ]]; then
        echo "$entrada es un archivo regular."
    elif [[ -d "$entrada" ]]; then
        echo "$entrada es un directorio."
    else
        echo "$entrada no es ni un archivo ni un directorio."
    fi
done