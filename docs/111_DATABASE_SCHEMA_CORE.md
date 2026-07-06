# 111 — Database Schema Core

## Objetivo

Definir o schema central do banco do SEO20 para sustentar o MVP com organizações, usuários, clientes, sites, auditorias, recomendações e relatórios.

## Tabelas centrais

### organizations

Representa uma agência ou conta principal.

Campos sugeridos:

- id.
- name.
- slug.
- status.
- plan_key.
- created_at.
- updated_at.

### organization_memberships

Relaciona usuários com organizações.

Campos sugeridos:

- id.
- organization_id.
- user_id.
- role.
- status.
- created_at.
- updated_at.

### clients

Representa clientes atendidos por uma organização.

Campos sugeridos:

- id.
- organization_id.
- name.
- segment.
- status.
- notes.
- created_at.
- updated_at.

### websites

Representa sites auditados.

Campos sugeridos:

- id.
- organization_id.
- client_id.
- url.
- normalized_domain.
- status.
- created_at.
- updated_at.

### audits

Representa uma execução de auditoria.

Campos sugeridos:

- id.
- organization_id.
- client_id.
- website_id.
- status.
- audit_type.
- started_at.
- finished_at.
- created_by.
- created_at.

### audit_findings

Achados detectados durante auditoria.

Campos sugeridos:

- id.
- organization_id.
- audit_id.
- category.
- severity.
- title.
- description.
- evidence.
- created_at.

### recommendations

Ações recomendadas pelo sistema.

Campos sugeridos:

- id.
- organization_id.
- client_id.
- audit_id.
- title.
- description.
- priority.
- status.
- impact.
- effort.
- created_at.
- updated_at.

### reports

Relatórios gerados a partir de auditorias.

Campos sugeridos:

- id.
- organization_id.
- client_id.
- audit_id.
- report_type.
- status.
- file_id.
- created_by.
- generated_at.
- created_at.

## Regras gerais

- Todas as tabelas de tenant devem conter `organization_id`.
- Relacionamentos críticos devem ter integridade referencial.
- Status deve ser controlado por enums ou valores documentados.
- Campos temporais devem usar timezone.
- Exclusão lógica deve ser considerada para dados operacionais.

## Índices iniciais

- organization_id.
- client_id.
- website_id.
- audit_id.
- status.
- created_at.

## Evolução futura

- Data warehouse.
- Histórico de score.
- Eventos detalhados.
- Campos customizados.
- Views materializadas para dashboards.