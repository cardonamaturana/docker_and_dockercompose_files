# Utiliza una imagen base de Jenkins LTS
FROM jenkins/jenkins:lts

# Cambia al usuario root para instalar Docker y Docker Compose
USER root

# Instala las dependencias necesarias
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Agrega la clave GPG de Docker
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Agrega el repositorio de Docker
RUN echo "deb [signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Instala Docker
RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io

# Instala Docker Compose
RUN curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# Cambia al usuario jenkins
USER jenkins
