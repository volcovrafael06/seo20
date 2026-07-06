# 104 — Backend Scaffolding Plan

## Objetivo

Definir a estrutura inicial do backend FastAPI do SEO20.

## Pastas sugeridas

```text
backend/
  app/
    api/
    core/
    db/
    models/
    schemas/
    services/
    workers/
    integrations/
    agents/
    reports/
    security/
    observability/
  tests/
```

## Módulos iniciais

- Auth.
- Organizations.
- Users.
- Clients.
- Websites.
- Audits.
- Recommendations.
- Reports.
- Integrations.
- Jobs.

## Regras

- Services concentram regra de negócio.
- Routers ficam finos.
- Schemas validam entrada e saída.
- Workers executam tarefas longas.
- Segurança é validada no backend.

## Primeiro milestone

Criar API com healthcheck, autenticação básica, organizações, clientes e sites.