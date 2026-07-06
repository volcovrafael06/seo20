# 32 — ERD: Modelo Entidade-Relacionamento

## Objetivo

Documentar o modelo entidade-relacionamento do SEO20 para orientar banco, backend, RLS, relatórios e futuras evoluções.

## Entidades centrais

### organizations

Representa a agência ou workspace.

Relacionamentos:

- organizations 1:N profiles.
- organizations 1:N clients.
- organizations 1:N integrations.
- organizations 1:N knowledge_documents.

### profiles

Perfil do usuário autenticado.

Relacionamentos:

- profiles N:1 organizations.
- profiles 1:N audit_logs.
- profiles 1:N approved_actions.

### clients

Empresas analisadas.

Relacionamentos:

- clients N:1 organizations.
- clients 1:N audits.
- clients 1:N competitors.
- clients 1:N integrations.

### audits

Execuções de auditoria.

Relacionamentos:

- audits N:1 clients.
- audits 1:N audit_tasks.
- audits 1:N keywords.
- audits 1:N competitors.
- audits 1:N serp_results.
- audits 1:N recommendations.
- audits 1:N reports.

### audit_tasks

Subtarefas da auditoria.

Relacionamentos:

- audit_tasks N:1 audits.

### keywords

Palavras-chave associadas a cliente e auditoria.

Relacionamentos:

- keywords N:1 audits.
- keywords 1:N serp_results.

### competitors

Concorrentes descobertos.

Relacionamentos:

- competitors N:1 audits.
- competitors 1:N gbp_profiles.
- competitors 1:N backlinks.

### serp_results

Resultados orgânicos e locais.

Relacionamentos:

- serp_results N:1 audits.
- serp_results N:1 keywords.

### recommendations

Ações sugeridas.

Relacionamentos:

- recommendations N:1 audits.
- recommendations 1:N automation_actions.

### reports

Relatórios gerados.

Relacionamentos:

- reports N:1 audits.

## Entidades futuras

### integrations

Conexões OAuth e credenciais criptografadas.

### automation_actions

Ações corretivas aprovadas ou pendentes.

### audit_logs

Registro de ações e eventos.

### knowledge_documents

Documentos da base de conhecimento.

### knowledge_chunks

Chunks vetorizados.

### billing_subscriptions

Assinaturas SaaS futuras.

## Diagrama textual

```txt
organizations
  ├── profiles
  ├── clients
  │     ├── audits
  │     │     ├── audit_tasks
  │     │     ├── keywords
  │     │     │     └── serp_results
  │     │     ├── competitors
  │     │     ├── recommendations
  │     │     │     └── automation_actions
  │     │     └── reports
  │     └── integrations
  └── knowledge_documents
        └── knowledge_chunks
```

## Regras de modelagem

- Toda entidade de negócio deve possuir `organization_id` direta ou indiretamente.
- Dados pesados e variáveis podem usar `jsonb`, mas campos usados em filtros devem ser colunas normais.
- Dados brutos de APIs devem ser salvos para auditoria, mas separados de dados normalizados.
- Scores devem ser persistidos para histórico.
- Recomendações devem ser versionadas quando recalculadas.

## Índices recomendados

- `organization_id` em tabelas multiempresa.
- `client_id` em auditorias.
- `audit_id` em resultados.
- `keyword` para busca.
- `domain` em concorrentes.
- `status` em auditorias e tasks.

## Evolução futura

Quando a plataforma crescer, avaliar:

- Tabelas particionadas para SERP e logs.
- Banco analítico separado.
- Materialized views para dashboards.
- Data warehouse para relatórios históricos.