#!/bin/bash

#Atualiza a lista de pacotes dos repositorios ja adicionado:
apt-get update

#Instala pacotes para permitir o APT usar repositorios com HTTPS
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

#Adiciona a chave publica do Docker ao APT:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -


#Verifica se a chave esta instala corretamente
apt-key fingerprint 0EBFCD88

#Configura o repositorio estavel do docker ao APT
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

#Instala a docker engine após atualizar os pacotes novamente
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io

#Roda a classica imagem hello word para verificar se a instalação ocorreu corretamente
docker run hello-world