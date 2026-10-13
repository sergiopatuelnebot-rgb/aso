bytes_a_gb() {
    local bytes=50000000000
    local gigas=$(echo "scale=2; $bytes / 1073741824" | bc)
    echo "$bytes bytes son $gigas GB"
}

bytes_a_gb