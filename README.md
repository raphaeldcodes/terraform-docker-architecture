# Orquestração de Infraestrutura Local com Terraform e Docker

Este é um projeto de **Infraestrutura como Código (IaC)** onde utilizei o **Terraform** para automatizar e aprovisionar um ambiente web completo, seguro e isolado dentro de containers **Docker**.

## O que este projeto faz?

A arquitetura simula um ambiente real de produção seguindo as melhores práticas de Cloud:

* **Rede Privada Isolada:** Cria uma rede virtual própria no Docker (`rede_interna_projeto`).
* **Banco de Dados Protegido (Postgres):** O container do banco de dados fica trancado dentro desta rede privada. Ele **não** expõe portas para a internet, protegendo as informações contra ataques externos.
* **Servidor Web como Escudo (Nginx):** É o único container exposto para o mundo exterior (através da porta `8080`). Ele recebe os acessos dos utilizadores e comunica internamente com o banco de dados.
* **Ordem Lógica Automatizada:** Utiliza a diretiva `depends_on` para garantir que o servidor web só seja iniciado após o banco de dados estar 100% operacional.

## Tecnologias Utilizadas

* **Terraform** 
* **Docker** (Containers)

## Organização dos Arquivos (.tf)

O projeto foi estruturado seguindo os padrões de mercado:
* `main.tf`: O coração do projeto. Contém a declaração dos recursos (redes, imagens e containers).
* `variables.tf`: Centraliza os parâmetros configuráveis (portas, senhas, nomes) para evitar valores fixos no código.
* `outputs.tf`: Painel de controlo que exibe os dados de conectividade prontos a usar após a execução.
