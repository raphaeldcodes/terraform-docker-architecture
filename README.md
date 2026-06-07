Orquestração de Infraestrutura Local com Terraform e Docker
Este projeto implementa o conceito de Infraestrutura como Código (IaC) utilizando o Terraform para automatizar o provisionamento e a configuração de um ambiente web seguro e isolado baseado em containers Docker.
Descrição do Projeto
A arquitetura desenvolvida simula um ambiente de produção seguindo práticas recomendadas de segurança e redes:
 Rede Privada Isolada: Criação de uma rede virtual dedicada no Docker (⁠rede_interna_projeto⁠).
 Segregação do Banco de Dados (PostgreSQL): O container de banco de dados é implantado exclusivamente na rede privada interna, sem exposição de portas para o host externo, mitigando vetores de ataque diretos.
 Proxy/Servidor Web (Nginx): Atua como o único ponto de entrada do ambiente, exposto externamente na porta ⁠8080⁠. Ele gerencia as requisições externas e estabelece a comunicação interna com a camada de dados.
 Gerenciamento de Dependências: Utilização da diretiva ⁠depends_on⁠ para garantir a ordenação lógica do deploy, inicializando o servidor web somente após a estabilização do serviço de banco de dados.
Tecnologias Utilizadas
 Terraform (HashiCorp Configuration Language - HCL)
 Docker (Tecnologia de Containers)
Estrutura de Arquivos (.tf)
O projeto adota uma estrutura modular padrão:
 ⁠main.tf⁠: Arquivo principal contendo a declaração de recursos, incluindo redes, imagens e containers.
 ⁠variables.tf⁠: Centralização de variáveis e parâmetros configuráveis (portas, credenciais e nomes), eliminando valores hardcoded no código fonte.
 ⁠outputs.tf⁠: Definição de dados de saída exibidos após a execução, facilitando a validação da conectividade do ambiente.
