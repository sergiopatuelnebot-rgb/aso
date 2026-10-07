#!/bin/bash

if [[ $1 =~ ^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}$ ]] then

echo "$1 Tiene formato de IP"

else 

echo "$1 No tiene formato de IP"

fi

#! Si que funciona porque siguen siendo 3 caractéres separados por puntos.

