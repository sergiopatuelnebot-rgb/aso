#!/bin/bashif [[ ! "$1" =~ ^[0-9]{1,3}$ ]]; then
echo "Error: $1 no es un número de días válido"
exit 1
fiANTERIOR=$(grep "^PASS_MAX_DAYS" login.defs)
echo "Antes: $ANTERIOR"sed -i.bak "s/^PASS_MAX_DAYS[[:blank:]][0-9]/PASS_MAX_DAYS $1/" login.defsNUEVO=$(grep "^PASS_MAX_DAYS" login.defs)
echo "Después: $NUEVO"