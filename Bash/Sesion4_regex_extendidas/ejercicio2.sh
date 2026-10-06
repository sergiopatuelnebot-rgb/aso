#!/bin/bash

if [[ $1 =~ ^[0-9a-fA-F]{2}([:-][0-9a-fA-F]{2}){5}$ ]]; then

echo "$1 Tiene formato de MAC"

else 

echo "$1 No tiene formato de MAC"

fi
