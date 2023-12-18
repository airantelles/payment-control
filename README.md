## Pré-requisitos

Certifique-se de ter o Ruby (2.7.2) e o Ruby on Rails (6.1.7) instalados em sua máquina. Você também deve ter o Git configurado.

## Configuração do Projeto

#### Clone o repositório:

  ```bash
  git clone https://github.com/monde-testes/payment-control.git
  cd payment-control
  ```

#### Instale o nvm e a versão 2.7.2 do Ruby:

  ```bash
  sudo apt-get update
  sudo apt-get install -y curl gpg
  \curl -sSL https://get.rvm.io | bash -s stable
  source ~/.rvm/scripts/rvm
  rvm install "ruby-2.7.2"
  rvm use 2.7.2 --default
  ```

#### Execute a instalação das dependências do projeto

  ```bash
  bundle install
  ```

#### Intalação do node, npm e o yarn:

  ```bash
  curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  sudo apt-get install npm
  sudo apt-get install -y nodejs
  sudo npm install -g yarn
  ```
#### Configuração do yarn e do webpacker:

  ```bash
  rails webpacker:install
  yarn install
  rails webpacker:compile
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
  rails server -b 0.0.0.0 -p 3000
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