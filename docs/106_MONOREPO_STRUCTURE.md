# 106 — Monorepo Structure

## Objetivo

Definir a organização do repositório SEO20 para suportar frontend, backend, banco, infraestrutura, documentação e prompts.

## Estrutura

```text
backend/
frontend/
database/
infrastructure/
docs/
prompts/
```

## Responsabilidades

- `backend`: API, workers e integrações.
- `frontend`: interface web.
- `database`: migrations e seeds.
- `infrastructure`: deploy e automação.
- `docs`: especificações técnicas.
- `prompts`: prompts versionados dos agentes.

## Regra

Cada área deve possuir README próprio e scripts claros de execução.