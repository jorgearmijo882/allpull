#!/bin/bash
# Se debe tener configurada la llave SSH en el servidor Gitlab.

# Directorio base donde están todos los proyectos de Git
CUR_DIR=$(pwd)

# Mensaje inicial
echo "Bajando los repositorios y todas sus ramas..."

# Buscar los directorios con repositorios Git y hacer pull de todas las ramas
for i in $(find . -name ".git" | cut -c 3-); do
    echo ""
    echo "**** Procesando: $i ****"
    
    # Cambiar al directorio del repositorio
    cd "$i"
    cd ..
    
    # Obtener todas las ramas remotas y sincronizarlas
    git fetch --all
    
    # Hacer un pull de todas las ramas
    for branch in $(git branch -r | grep -v '\->' | sed 's/origin\///'); do
        echo "Actualizando rama: $branch"
        git checkout $branch
        git pull origin $branch
    done
    
    # Regresar al directorio principal
    cd "$CUR_DIR"
done

echo "Descarga completa de todos los repositorios y sus ramas."
