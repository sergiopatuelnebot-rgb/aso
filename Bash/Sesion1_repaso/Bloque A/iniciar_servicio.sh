echo "Iniciando el servicio $1"

if [ -z "$1" ]; then
    echo "Error: No se proporcionó el nombre del servicio."
else
    echo "El servicio $1 se ha iniciado correctamente."
fi