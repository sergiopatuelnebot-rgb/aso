contar_por_extension () {
    read -p "Dime una carpeta: " carpeta
ext = "nigga"

    for ext in log txt csv ; do
    find ~/"$carpeta" -maxdepth 1 -type f -name "*.$ext" | wc -l | echo ""
    done
}
contar_por_extension