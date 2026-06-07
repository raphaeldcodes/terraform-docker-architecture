variable "container_web_name" {
  description = "Nome do container do servidor web"
  type        = string
  default     = "web-server-portfolio"
}

variable "external_port" {
  description = "Porta externa para acessar o Nginx"
  type        = number
  default     = 8080
}

variable "db_password" {
  description = "Senha do banco de dados"
  type        = string
  default     = "senha_segura_123"
}