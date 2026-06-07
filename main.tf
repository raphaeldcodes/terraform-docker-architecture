terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# 1. Cria uma rede privada para os containers conversarem
resource "docker_network" "private_network" {
  name = "rede_interna_projeto"
}

# 2. Baixa as imagens oficiais do Docker Hub
resource "docker_image" "nginx_img" {
  name = "nginx:latest"
}

resource "docker_image" "postgres_img" {
  name = "postgres:15-alpine"
}

# 3. Cria o Container do Banco de Dados (Postgres)
resource "docker_container" "db_container" {
  name  = "banco-dados-portfolio"
  image = docker_image.postgres_img.image_id

  # Adiciona variáveis de ambiente para o Postgres
  env = [
    "POSTGRES_PASSWORD=${var.db_password}",
    "POSTGRES_USER=admin",
    "POSTGRES_DB=meudb"
  ]

  # Conecta o banco à nossa rede privada (ele não fica exposto para a internet)
  networks_advanced {
    name = docker_network.private_network.name
  }
}

# 4. Cria o Container do Servidor Web (Nginx)
resource "docker_container" "web_container" {
  name  = var.container_web_name
  image = docker_image.nginx_img.image_id

  # Expõe a porta para você conseguir acessar do seu navegador
  ports {
    internal = 80
    external = var.external_port
  }

  networks_advanced {
    name = docker_network.private_network.name
  }

  # Garante que o Nginx só vai subir DEPOIS que o banco já estiver de pé
  depends_on = [docker_container.db_container]
}