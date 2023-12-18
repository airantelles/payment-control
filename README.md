## Pré-requisitos

Certifique-se de ter o Ruby (2.7.2) e o Ruby on Rails (6.1.7) instalados em sua máquina. Você também deve ter o Git configurado.

## Configuração do Projeto

#### Clone o repositório:

  ```bash
  git clone https://github.com/monde-testes/payment-control.git
  cd payment-control
  ```

#### Execute a instalação das dependências do projeto

  ```bash
  bundle install
  ```

#### Configure o banco de dados de desenvolvimento

  ```bash
  rails db:create
  rails db:migrate
  ```

#### Configure o banco de dados de testes

  ```bash
  rails db:test:create
  rails db:test:migrate
  ```
  
#### Execute os testes

  ```bash
  rspec
  ```
  
#### Configure as tarefas agendadas no ambiente de desenvolvimeto

  ```bash
  whenever --update-crontab --set environment='development'
  ```
  
## Execução do Projeto

#### Execute o servidor localmente

  ```bash
  rails server
  ```

#### Acessar a aplicação pelo navegador

  - O aplicativo estará disponível em `http://localhost:3000`

## Execução das tarefas programadas

Você também pode executar tarefas agendadas manualmente sempre que precisar. Para fazer isso, utilize o seguinte comando:

#### Tarefa de processamento de pagamentos

  ```bash
  rake invoices:process
  ```
  
#### Tarefa de reprocessamento de pagamentos

  ```bash
  rake invoices:reprocess
  ```