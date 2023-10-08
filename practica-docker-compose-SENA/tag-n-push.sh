#!/bin/bash

# Etiquetar las imágenes
docker tag crud-test-db:latest harbor.tallerdevops.com/actividad4-maurogomez/crud-test-db:1.0.0
docker tag crud-test-back:latest harbor.tallerdevops.com/actividad4-maurogomez/crud-test-back:1.0.0
docker tag crud-test-front:latest harbor.tallerdevops.com/actividad4-maurogomez/crud-test-front:1.0.0

# Subir las imágenes al registro de contenedores
docker push harbor.tallerdevops.com/actividad4-maurogomez/crud-test-db:1.0.0
docker push harbor.tallerdevops.com/actividad4-maurogomez/crud-test-back:1.0.0
docker push harbor.tallerdevops.com/actividad4-maurogomez/crud-test-front:1.0.0


