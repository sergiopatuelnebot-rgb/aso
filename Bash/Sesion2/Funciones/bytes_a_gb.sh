 bytes_a_gb() {
    b=$df --block-size=1b --output=avail / | tail -n 1 | tr -d ' '
    echo "Bytes disponibles: $b$"
}