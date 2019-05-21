#!/bin/bash
# se debe tener la llave ssh de la maquina desde la cual se va ejecutar
# el script en el servidor del gitlab

# directorio base donde estan todos los proyectos de Git
CUR_DIR=$(pwd)

# Mensaje de pull
echo "Pulling All repositories"

# busca los directorios y hace un pull de todos al master registrado
for i in $(find . -name ".git" | cut -c 3-); do
    echo "";
    echo "****$i****";

    # Se mueve a cada uno de los proyectos
    cd "$i";
    cd ..;
    # finalmente hace el pull
    git pull origin master;
    # regresa al directorio principal
    cd $CUR_DIR
done
echo "Pulling All repositories Complete"
