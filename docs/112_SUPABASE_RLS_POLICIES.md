# 112 — Supabase RLS Policies

## Objetivo

Definir o modelo de Row Level Security do SEO20 no Supabase para garantir isolamento entre organizações.

## Princípio central

Todo dado de tenant deve ser filtrado por `organization_id` e validado contra a tabela `organization_memberships`.

## Tabelas com RLS obrigatório

- organizations.
- organization_memberships.
- clients.
- websites.
- audits.
- audit_findings.
- recommendations.
- reports.
- files.
- integrations.
- audit_logs.

## Regras base

### Leitura

Usuário pode ler dados de uma organização quando possui membership ativo naquela organização.

### Escrita

Usuário pode escrever quando possui papel compatível com a ação.

### Administração

Ações administrativas exigem papel `owner` ou `admin`.

## Papéis

- owner.
- admin.
- analyst.
- sales.
- client_viewer.

## Políticas por tipo de tabela

### organizations

- Owner e Admin podem ler dados da organização.
- Atualização apenas por Owner.

### clients

- Owner, Admin e Analyst podem ler.
- Client Viewer lê apenas clientes permitidos.
- Criação e edição por Owner/Admin.

### websites

- Segue permissão do cliente vinculado.

### audits

- Usuários internos podem ler auditorias dos clientes permitidos.
- Execução deve ser validada no backend.

### reports

- Usuários internos acessam conforme cliente.
- Client Viewer acessa apenas relatórios liberados.

## Service role

A chave service role deve ser usada apenas no backend e workers, nunca no frontend.

## Testes mínimos

- Usuário sem membership não acessa dados.
- Usuário da organização A não lê dados da organização B.
- Client Viewer não acessa clientes não permitidos.
- Analyst não altera billing.
- Owner altera configurações críticas.

## Regra final

Toda tabela nova deve declarar se é global, administrativa ou multi-tenant antes de receber RLS.