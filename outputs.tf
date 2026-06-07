output "url_acesso" {
  value       = "http://localhost:${var.external_port}"
  description = "Acesse o servidor web por esta URL"
}

output "status_banco" {
  value       = "Banco de dados rodando internamente na rede: ${docker_network.private_network.name}"
  description = "Status da rede do banco"
}