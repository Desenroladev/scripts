#!/bin/bash

#Atualiza a lista de pacotes dos repositorios ja adicionado:
apt-get update

#Instala pacotes para permitir o APT usar repositorios com HTTPS
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

#Adiciona a chave publica do Docker ao APT:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

#Configura o repositorio estavel do docker ao APT
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#Instala a docker engine após atualizar os pacotes novamente
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io

#Roda a classica imagem hello word para verificar se a instalação ocorreu corretamente
docker run hello-world
