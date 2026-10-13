porcentaje=$(( ($1 * 100) / $2 ));
    if [ $porcentaje -lt 70 ]; then
        echo "El nivel de uso del disco es OK."
    elif [ $porcentaje -ge 70 ] && [ $porcentaje -lt 90 ]; then
        echo "El nivel de uso del disco es AVISO."
    else
        echo "El nivel de uso del disco es CRÍTICO."
fi
echo "El nivel de uso del disco es: $porcentaje%"