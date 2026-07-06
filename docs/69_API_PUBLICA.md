# 69 — API Pública

## Objetivo

Definir a futura API pública do SEO20 para permitir integrações externas com CRMs, ERPs, ferramentas de BI, automações e sistemas internos de agências.

## Princípios

- API versionada.
- Autenticação forte.
- Rate limit por organização.
- Logs completos.
- Documentação OpenAPI.
- Webhooks para eventos assíncronos.

## Versão inicial

Prefixo recomendado:

```text
/api/v1
```

## Autenticação

Opções futuras:

- API Key por organização.
- OAuth 2.0.
- JWT para integrações internas.

## Recursos iniciais

### Clients

- Listar clientes.
- Criar cliente.
- Atualizar cliente.
- Consultar cliente.

### Websites

- Listar sites.
- Criar site.
- Consultar site.

### Audits

- Criar auditoria.
- Consultar status.
- Listar auditorias.
- Consultar resultado.

### Reports

- Listar relatórios.
- Consultar relatório.
- Gerar relatório.
- Obter URL assinada.

### Recommendations

- Listar recomendações.
- Atualizar status.
- Consultar prioridade.

### Integrations

- Consultar integrações ativas.
- Consultar status de conexão.

## Rate limits

Rate limit deve considerar:

- Plano.
- Tipo de endpoint.
- Custo operacional.
- Uso de APIs externas.

Endpoints que disparam auditoria devem ter limites mais rígidos.

## Respostas padrão

Toda resposta deve conter:

- data.
- meta quando aplicável.
- error quando houver falha.
- request_id para rastreabilidade.

## Erros padrão

- 400 Bad Request.
- 401 Unauthorized.
- 403 Forbidden.
- 404 Not Found.
- 409 Conflict.
- 422 Validation Error.
- 429 Rate Limited.
- 500 Internal Error.

## Segurança

- API Keys devem ser armazenadas como hash.
- Permitir rotação de chaves.
- Permitir revogação.
- Registrar IP e user-agent quando aplicável.
- Nunca retornar segredos.
- Aplicar escopos por chave.

## Escopos sugeridos

- clients:read.
- clients:write.
- audits:read.
- audits:write.
- reports:read.
- recommendations:read.
- recommendations:write.
- integrations:read.

## Documentação

A API deve gerar documentação automática com OpenAPI/Swagger e exemplos de curl.

## Futuro

- SDK JavaScript.
- SDK Python.
- Webhook subscriptions.
- OAuth para apps de terceiros.
- Marketplace de integrações.