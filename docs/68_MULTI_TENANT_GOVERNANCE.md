# 68 — Multi-Tenant Governance

## Objetivo

Definir regras de governança para garantir isolamento, segurança e rastreabilidade em uma arquitetura multi-tenant.

## Princípio central

Toda informação sensível ou operacional deve estar vinculada a uma organização. Nenhum dado de uma organização pode ser acessado por outra.

## Escopo

- Organizações.
- Usuários.
- Clientes.
- Sites.
- Integrações.
- Auditorias.
- Relatórios.
- Recomendações.
- Eventos.
- Billing.

## Chave de isolamento

A coluna principal de isolamento será:

- organization_id.

Tabelas críticas devem possuir organization_id e políticas RLS quando expostas via Supabase.

## Papéis

### Owner

- Gerencia organização.
- Gerencia billing.
- Gerencia usuários.
- Acessa todos os clientes.

### Admin

- Gerencia clientes.
- Gerencia integrações.
- Executa auditorias.
- Acessa relatórios.

### Analyst

- Executa auditorias.
- Cria recomendações.
- Visualiza relatórios.

### Client Viewer

- Visualiza apenas clientes permitidos.
- Acessa relatórios compartilhados.

## Regras de acesso

- Usuário só acessa dados da própria organização.
- Permissões podem ser refinadas por cliente.
- Integrações pertencem à organização, não ao usuário isolado.
- Ações administrativas exigem papel apropriado.
- Logs devem registrar quem executou cada ação.

## Políticas RLS

Tabelas expostas ao frontend devem validar:

- auth.uid().
- organization_memberships.
- role.
- client_access quando aplicável.

## Auditoria

Eventos obrigatórios:

- UserInvited.
- UserRemoved.
- RoleChanged.
- IntegrationConnected.
- IntegrationRevoked.
- AuditStarted.
- ReportShared.
- BillingChanged.

## Limites por tenant

Cada organização deve ter limites de:

- Usuários.
- Clientes.
- Sites.
- Auditorias.
- Integrações.
- Storage.
- Chamadas de IA.
- Chamadas de APIs externas.

## Backup e retenção

- Dados devem ser retidos conforme plano.
- Exclusão de organização deve ter período de segurança.
- Exportação de dados deve ser possível para owner.
- Logs críticos podem ter retenção superior.

## Riscos

- Vazamento cross-tenant.
- Uso indevido de service role.
- Falha de RLS.
- Cache compartilhado incorretamente.
- Storage sem path isolado.

## Mitigações

- Testes de segurança multi-tenant.
- Prefixos por organization_id em storage.
- Cache key contendo organization_id.
- Revisão de queries críticas.
- Logs de acesso.
- Monitoramento de anomalias.

## Regra final

Qualquer nova tabela deve declarar explicitamente se é multi-tenant, global ou administrativa antes de ser criada.