#!/bin/bash

# Crear la carpeta para almacenar los datos de la base de datos
#mkdir -p ./database_data

# Crear una red de Docker personalizada 
docker network create \
  --driver bridge \
  crudtest

# Crear y ejecutar el contenedor de la base de datos
docker run \
  --name crudtestdb \
  --network crudtest \
  --restart unless-stopped \
    -p 3306:3306 \
  -e MYSQL_ROOT_PASSWORD=admin123 \
  -e MYSQL_DATABASE=test \
  -e MYSQL_USER=testuser \
  -e MYSQL_PASSWORD=testuser@123 \
  -v $(pwd)/database_data:/var/lib/mysql \
  -d mysql:latest

# Crear y ejecutar el backend
docker run \
  -p 8080:8080 \
  -e DATABASE_URL="jdbc:mysql://crudtestdb:3306/test?useSSL=false&useUnicode=yes&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&allowPublicKeyRetrieval=true" \
  --name crudtestback \
  --network crudtest \
  --restart unless-stopped \
  -d crud-test-back

  # Crear y ejecutar el front
  docker run \
  -p 8081:8081 \
  --name crudtestfront \
  --network crudtest \
  --restart unless-stopped \
  -d crud-test-front

# --restart unless-stopped establece la politica de reinicio indicando que el contenedor se reiniciará a menos que se detenga explícitamente.
# Mostrar los contenedores que se están ejecutando
docker ps
#para loguearse debe usar:
#clave:admin
#usuario:admin

