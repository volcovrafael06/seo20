# 08 — Backend FastAPI

## Objetivo

Definir a estrutura do backend responsável por autenticação de API, orquestração de auditorias, workers, integrações, geração de relatórios e automações.

## Stack

- Python 3.12+.
- FastAPI.
- Pydantic v2.
- SQLAlchemy ou Supabase client.
- Celery.
- Redis.
- Playwright.
- HTTPX.
- OpenAI SDK.
- WeasyPrint ou Playwright PDF.

## Estrutura sugerida

```txt
backend/
├── app/
│   ├── main.py
│   ├── core/
│   │   ├── config.py
│   │   ├── security.py
│   │   └── logging.py
│   ├── api/
│   │   ├── routes_clients.py
│   │   ├── routes_audits.py
│   │   ├── routes_reports.py
│   │   ├── routes_integrations.py
│   │   └── routes_webhooks.py
│   ├── services/
│   │   ├── audit_service.py
│   │   ├── keyword_service.py
│   │   ├── seo_service.py
│   │   ├── competitor_service.py
│   │   ├── backlink_service.py
│   │   ├── ads_service.py
│   │   └── report_service.py
│   ├── workers/
│   │   ├── celery_app.py
│   │   ├── audit_tasks.py
│   │   └── report_tasks.py
│   ├── integrations/
│   │   ├── google/
│   │   ├── meta/
│   │   ├── dataforseo/
│   │   ├── semrush/
│   │   └── ahrefs/
│   └── schemas/
└── requirements.txt
```

## Responsabilidades da API

A API não deve executar auditorias pesadas diretamente. Ela deve:

1. Validar usuário.
2. Criar registros no Supabase.
3. Criar tarefas de auditoria.
4. Enviar jobs para Redis/Celery.
5. Consultar status.
6. Entregar resultados.

## Endpoints principais

### Clientes

- `GET /clients`
- `POST /clients`
- `GET /clients/{id}`
- `PATCH /clients/{id}`

### Auditorias

- `POST /audits`
- `GET /audits`
- `GET /audits/{id}`
- `POST /audits/{id}/run`
- `GET /audits/{id}/status`
- `GET /audits/{id}/recommendations`

### Relatórios

- `POST /audits/{id}/reports`
- `GET /reports/{id}`
- `GET /reports/{id}/download`

### Integrações

- `GET /integrations`
- `POST /integrations/google/connect`
- `POST /integrations/meta/connect`
- `POST /integrations/wordpress/connect`

## Autenticação

O frontend usa Supabase Auth. O backend valida JWT do Supabase em cada chamada. Workers usam service role em ambiente protegido.

## Filas

Cada auditoria gera múltiplas tarefas:

- normalize_domain.
- crawl_site.
- collect_keywords.
- collect_serp.
- collect_maps.
- audit_seo.
- audit_backlinks.
- audit_ads.
- generate_recommendations.
- generate_report.

## Tratamento de erros

Toda task deve gravar:

- status.
- progresso.
- erro.
- tempo de execução.
- dados brutos quando possível.

## Logs

Logs devem ser estruturados em JSON e enviados para observabilidade. Nunca gravar tokens, chaves de API ou dados sensíveis.