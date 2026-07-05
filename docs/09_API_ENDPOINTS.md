# 09 — API Endpoints

## Convenções

Base URL local:

`http://localhost:8000/api/v1`

Todos os endpoints privados exigem token Supabase no header:

`Authorization: Bearer <access_token>`

## Clientes

### Criar cliente

`POST /clients`

Payload:

```json
{
  "name": "Persialux",
  "website_url": "https://www.persialux.com.br",
  "city": "Sorocaba",
  "state": "SP",
  "segment": "Cortinas e Persianas"
}
```

Resposta:

```json
{
  "id": "uuid",
  "name": "Persialux",
  "status": "active"
}
```

### Listar clientes

`GET /clients`

Filtros:

- `status`
- `segment`
- `city`

### Obter cliente

`GET /clients/{client_id}`

## Auditorias

### Criar auditoria

`POST /audits`

Payload:

```json
{
  "client_id": "uuid",
  "audit_type": "full"
}
```

### Executar auditoria

`POST /audits/{audit_id}/run`

Cria as tarefas assíncronas e inicia o processamento.

### Status da auditoria

`GET /audits/{audit_id}/status`

Resposta:

```json
{
  "audit_id": "uuid",
  "status": "running",
  "progress": 42,
  "tasks": [
    {"task_type": "crawl_site", "status": "done", "progress": 100},
    {"task_type": "collect_keywords", "status": "running", "progress": 45}
  ]
}
```

### Resultado da auditoria

`GET /audits/{audit_id}`

Inclui scores, resumo e links de relatório.

## Keywords

### Listar palavras da auditoria

`GET /audits/{audit_id}/keywords`

Campos retornados:

- keyword.
- source.
- volume.
- cpc.
- difficulty.
- intent.
- priority.

## Concorrentes

### Listar concorrentes

`GET /audits/{audit_id}/competitors`

Campos:

- name.
- domain.
- organic_frequency.
- maps_frequency.
- priority.

## Recomendações

### Listar recomendações

`GET /audits/{audit_id}/recommendations`

Filtros:

- module.
- priority.
- status.

### Atualizar status

`PATCH /recommendations/{recommendation_id}`

Payload:

```json
{
  "status": "approved"
}
```

## Relatórios

### Gerar relatório

`POST /audits/{audit_id}/reports`

Payload:

```json
{
  "template": "executive",
  "include_proposal": true
}
```

### Download

`GET /reports/{report_id}/download`

Retorna URL assinada do PDF.

## Integrações

### Google

- `POST /integrations/google/connect`
- `GET /integrations/google/accounts`
- `POST /integrations/google/disconnect`

### Meta

- `POST /integrations/meta/connect`
- `GET /integrations/meta/accounts`
- `POST /integrations/meta/disconnect`

### WordPress

- `POST /integrations/wordpress/connect`
- `POST /integrations/wordpress/test`

## Automações futuras

### Criar ação corretiva

`POST /automations/actions`

Payload:

```json
{
  "recommendation_id": "uuid",
  "action_type": "wordpress_update_page",
  "requires_approval": true
}
```

### Aprovar ação

`POST /automations/actions/{action_id}/approve`

Nenhuma ação corretiva deve ser executada sem aprovação explícita.