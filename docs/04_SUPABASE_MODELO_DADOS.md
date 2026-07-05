# 04 — Supabase e Modelo de Dados

## Objetivo

Definir a base de dados, autenticação, permissões, storage e estrutura multiempresa do SEO20.

## Decisão arquitetural

O Supabase será usado como:

- Banco PostgreSQL.
- Autenticação.
- Storage de relatórios, screenshots e exports.
- Realtime para status de auditorias.
- RLS para isolamento entre organizações.
- pgvector para memória semântica e base de conhecimento.

## Entidades principais

### organizations

Representa uma agência, empresa ou workspace.

Campos principais:

- id.
- name.
- slug.
- plan.
- status.
- created_at.
- updated_at.

### profiles

Complementa `auth.users` com dados do usuário.

Campos:

- id.
- organization_id.
- full_name.
- avatar_url.
- role.
- created_at.

Papéis previstos:

- owner.
- admin.
- strategist.
- analyst.
- sales.
- client_viewer.

### clients

Empresas analisadas pela agência.

Campos:

- id.
- organization_id.
- name.
- domain.
- website_url.
- city.
- state.
- country.
- segment.
- description.
- status.
- created_at.

### audits

Cada auditoria executada para um cliente.

Campos:

- id.
- organization_id.
- client_id.
- status.
- audit_type.
- started_at.
- finished_at.
- score_general.
- score_seo.
- score_local.
- score_backlinks.
- score_ads.
- score_cro.
- score_geo.
- report_url.
- raw_summary.

### audit_tasks

Subtarefas assíncronas da auditoria.

Campos:

- id.
- audit_id.
- task_type.
- status.
- progress.
- error_message.
- started_at.
- finished_at.
- metadata jsonb.

### keywords

Palavras-chave coletadas e classificadas.

Campos:

- id.
- organization_id.
- client_id.
- audit_id.
- keyword.
- source.
- volume.
- cpc.
- difficulty.
- intent.
- local_modifier.
- priority.

### competitors

Concorrentes descobertos.

Campos:

- id.
- organization_id.
- client_id.
- audit_id.
- name.
- domain.
- website_url.
- google_business_url.
- source.
- organic_frequency.
- maps_frequency.
- priority.

### serp_results

Resultados orgânicos por busca.

Campos:

- id.
- audit_id.
- keyword_id.
- position.
- title.
- url.
- domain.
- snippet.
- is_ad.
- is_featured.
- captured_at.

### gbp_profiles

Dados de Google Business Profile.

Campos:

- id.
- audit_id.
- competitor_id.
- business_name.
- rating.
- review_count.
- categories jsonb.
- services jsonb.
- products jsonb.
- photos_count.
- hours jsonb.
- service_areas jsonb.
- raw_data jsonb.

### backlinks

Dados de backlinks.

Campos:

- id.
- audit_id.
- target_domain.
- source_domain.
- source_url.
- target_url.
- anchor_text.
- rel_type.
- authority_score.
- toxicity_score.
- first_seen.
- last_seen.

### recommendations

Recomendações geradas pelo sistema.

Campos:

- id.
- audit_id.
- module.
- title.
- description.
- impact.
- effort.
- priority.
- status.
- evidence jsonb.

### reports

Relatórios gerados.

Campos:

- id.
- audit_id.
- title.
- file_url.
- html_url.
- version.
- created_at.

## Storage

Buckets previstos:

- reports.
- screenshots.
- exports.
- client-assets.
- generated-content.

## RLS

Toda tabela de negócio deve possuir `organization_id`. Usuários só podem ler dados da própria organização. Clientes com role `client_viewer` só podem acessar clientes e relatórios permitidos.

## Política de segurança

- Secrets de APIs nunca ficam no frontend.
- Tokens OAuth são criptografados.
- Logs não devem salvar tokens.
- Relatórios públicos devem usar links assinados.
- Toda ação corretiva futura deve gerar log.