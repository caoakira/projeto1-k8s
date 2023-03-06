#!/bin/bash

echo "Criando as imagens..."

docker build -t akira78/projeto-backend:1.0 backend/.
docker build -t akira78/projeto-database:1.0 database/.

echo "Realizando o push das imagens..."

docker push akira78/projeto-backend:1.0
docker push akira78/projeto-database:1.0

echo "Criando os serviços do cluster..."

kubectl apply -f ./services.yml

echo "Realizando deployments..."

kubectl apply -f ./deployment.yml
