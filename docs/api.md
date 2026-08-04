# Manual da API

Este documento descreve o contrato HTTP observado no código atual. A fonte de verdade para rotas e permissões continua sendo `config/routes.rb` e os controllers em `app/controllers/api/v1`.

## Convenções gerais

- Todas as rotas retornam JSON.
- As rotas de negócio estão sob `/api`.
- A autenticação usa Devise Token Auth.
- O cliente deve enviar os cabeçalhos `access-token`, `client` e `uid` depois do login.
- A implementação atual usa a versão v1 por padrão. Para solicitar a versão explicitamente, use `Accept: application/vnd.mcu.v1`.

## Autenticação

| Método | Rota | Acesso | Uso |
| --- | --- | --- | --- |
| POST | `/api/auth/sign_in` | Público | Autenticar usuário |
| DELETE | `/api/auth/sign_out` | Token | Encerrar sessão |
| POST | `/api/auth` | Conforme configuração | Criar usuário |
| PUT | `/api/auth` | Token | Atualizar perfil |
| PUT | `/api/auth/password` | Token | Atualizar senha |
| POST | `/api/auth/password` | Público | Solicitar redefinição de senha |
| GET | `/api/auth/validate_token` | Token | Validar token |

## Usuários e papéis

| Método | Rota | Acesso | Uso |
| --- | --- | --- | --- |
| GET | `/api/roles` | Master | Listar papéis disponíveis |
| GET | `/api/users` | Master | Listar usuários |
| DELETE | `/api/users?id=:id` | Master | Remover usuário |

As listagens aceitam os parâmetros de ordenação e paginação usados pelo concern `Paginable`: `sort`, `dir`, `page` e `per_page`.

## Itens do acervo

| Método | Rota | Acesso | Uso |
| --- | --- | --- | --- |
| GET | `/api/items` | Token | Listar itens paginados |
| GET | `/api/items/status` | Master ou editor | Listar estados válidos |
| POST | `/api/item` | Master ou editor | Criar item |
| GET | `/api/item/:id` | Token | Consultar item |
| PUT | `/api/item/:id` | Master ou editor | Atualizar item |

### Formato de criação e atualização

O controller exige o envelope `item` no corpo da requisição:

```json
{
  "item": {
    "name": "Nome do item",
    "description": "Descrição",
    "material": "Material",
    "reference_measures": "Medidas",
    "release_date": "2022-01-01",
    "publication_date": "2022-01-02",
    "conservation_state": "Bom",
    "conservation_description": "Descrição do estado",
    "recommendations": "Recomendações",
    "general_observations": "Observações",
    "origin": "Origem",
    "country": "Brasil",
    "donor_by": "Doador",
    "donation_date": "2022-01-03",
    "localization": "Localização",
    "id_photo": "identificador-da-foto"
  }
}
```

Os campos permitidos são `name`, `id_photo`, `description`, `material`, `reference_measures`, `release_date`, `publication_date`, `conservation_state`, `conservation_description`, `recommendations`, `general_observations`, `origin`, `country`, `donor_by`, `donation_date` e `localization`.

Na criação, a API deriva `status`, `register_number`, `cataloged_by` e `last_change_by`. Na atualização, `status` também pode ser enviado.

## Pontos a validar antes de alterar o contrato

- Confirmar a URL base consumida pelo frontend em cada ambiente.
- Confirmar o formato real das respostas e dos erros usados pelo cliente.
- Preservar e ampliar os testes de request quando houver alteração de rota, cabeçalho ou payload.
