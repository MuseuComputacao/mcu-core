# MCU Core — API do Museu da Computação da UFRJ

API REST responsável pelo cadastro e pela consulta dos itens do acervo, além da autenticação e do gerenciamento de usuários do painel administrativo.

## Stack observada

As versões abaixo descrevem o checkout atual. Elas são referência para desenvolvimento e documentação; esta tarefa não atualiza dependências.

- Ruby 2.7.5 no `Gemfile` e na imagem Docker
- Rails 6.1.4.4
- PostgreSQL 12.1 no Docker Compose
- Redis para o Action Cable
- RSpec para testes
- RuboCop para análise estática

## Executar localmente

É necessário ter Docker e Docker Compose disponíveis.

Na raiz deste repositório:

```bash
docker compose up --build
```

O serviço ficará disponível em `http://localhost:3000`.

O comando de inicialização do Compose cria o banco, executa as migrações e carrega os dados de desenvolvimento. Não use os dados do seed em ambientes compartilhados ou de produção.

## Comandos úteis

```bash
# Validar a configuração do Compose sem iniciar os serviços
docker compose config

# Abrir um shell no container da aplicação
docker compose run --rm app sh

# Executar todos os testes
docker compose run --rm app bundle exec rspec

# Executar um arquivo de teste específico
docker compose run --rm app bundle exec rspec spec/requests/api/v1/items_spec.rb

# Executar o linter
docker compose run --rm app bundle exec rubocop
```

Para abrir o console Rails dentro do container:

```bash
docker compose run --rm app bundle exec rails console
```

## Manual da API

As rotas, os cabeçalhos de autenticação, os parâmetros de paginação e o formato esperado para itens estão documentados em [`docs/api.md`](docs/api.md).

As rotas usam o namespace `/api`. O constraint de versão atual seleciona a implementação v1 por padrão; o cabeçalho `Accept: application/vnd.mcu.v1` também identifica explicitamente a versão.

## Alterar gems ou a imagem

Alterações de dependências devem ser feitas em uma tarefa própria. Quando forem autorizadas, atualize o `Gemfile`, regenere o lockfile de forma intencional e registre a matriz de versões e os testes executados. Não edite `Gemfile.lock` como parte de uma alteração apenas documental.

## Convenções de Git

Branches e mensagens de commit devem usar inglês:

- Branches: `feat/branch-name`, `fix/branch-name`, `docs/branch-name`
- Commits: `feat(context): message`, `fix(context): message`, `docs(context): message`, `tests(context): message`

Antes de abrir um pull request, execute os testes e o RuboCop e descreva qualquer verificação que não tenha sido possível executar.
