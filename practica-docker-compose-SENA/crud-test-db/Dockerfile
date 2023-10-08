# Utilizar la imagen oficial de MySQL como base
FROM mysql:latest

# Establecer las variables de entorno para la base de datos, el usuario y la contraseña
ENV MYSQL_DATABASE=test
ENV MYSQL_USER=testuser
ENV MYSQL_PASSWORD=testuser@123
ENV MYSQL_ROOT_PASSWORD=admin123

EXPOSE 3306

# Copiar el archivo init.sql al directorio /docker-entrypoint-initdb.d/
COPY init.sql /docker-entrypoint-initdb.d/
