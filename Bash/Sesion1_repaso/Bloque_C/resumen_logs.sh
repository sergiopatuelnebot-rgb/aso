ERROR=$(grep -c "ERROR" ~/prueba_bash/datos/app*)
WARNING=$(grep -c "WARNING" ~/prueba_bash/datos/app*)
echo "Número de errores: $ERROR"
echo "Número de advertencias: $WARNING"