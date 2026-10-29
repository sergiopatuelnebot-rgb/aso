#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Uso: $0 <usuario> <shell>"
    exit 1
fi

USUARIO="$1"
SHELL_NUEVA="$2"
FICHERO="passwd"

if [[ ! "$SHELL_NUEVA" =~ ^(/bin/bash\vert{}/bin/sh\vert{}/bin/zsh)$ ]]; then
    echo "Error: la shell debe ser /bin/bash, /bin/sh o /bin/zsh"
    exit 1
fi

if [ ! -f "$FICHERO" ]; then
    echo "Error: El fichero $FICHERO no existe en la carpeta"
    exit 1
fi

if ! grep -q "^${USUARIO}:" "$FICHERO"; then
    echo "Error: el usuario $USUARIO no existe"
    exit 1
fi

sed -i.bak "/^${USUARIO}:/ s#:[^:]*$#:${SHELL_NUEVA}#" "$FICHERO"

grep "^${USUARIO}:" "$FICHERO"

