# 83 — Access Control and RBAC

## Objetivo

Definir o modelo de controle de acesso do SEO20 usando RBAC (Role-Based Access Control), com isolamento multi-tenant e permissões refinadas por organização e cliente.

## Princípios

- Negar por padrão.
- Conceder acesso mínimo necessário.
- Separar permissões administrativas, operacionais e de visualização.
- Toda ação sensível deve ser auditável.
- Permissões devem respeitar organização e, quando necessário, cliente específico.

## Entidades

- users.
- organizations.
- organization_memberships.
- roles.
- permissions.
- client_access.
- audit_logs.

## Papéis principais

### Owner

Permissões:

- Gerenciar organização.
- Gerenciar usuários.
- Gerenciar billing.
- Gerenciar integrações.
- Acessar todos os clientes.
- Configurar white-label.

### Admin

Permissões:

- Gerenciar clientes.
- Executar auditorias.
- Gerar relatórios.
- Configurar integrações operacionais.
- Gerenciar recomendações.

### Analyst

Permissões:

- Visualizar clientes permitidos.
- Executar auditorias.
- Criar recomendações.
- Gerar relatórios.
- Visualizar dados técnicos.

### Sales

Permissões:

- Visualizar diagnósticos comerciais.
- Gerar propostas.
- Usar Sales Engine.
- Usar Proposal Engine.
- Não alterar integrações técnicas.

### Client Viewer

Permissões:

- Visualizar relatórios compartilhados.
- Visualizar dashboards permitidos.
- Não executar auditorias.
- Não acessar configurações internas.

## Permissões sugeridas

- organization:read.
- organization:update.
- users:invite.
- users:remove.
- billing:read.
- billing:write.
- clients:read.
- clients:write.
- websites:read.
- websites:write.
- audits:read.
- audits:write.
- reports:read.
- reports:write.
- integrations:read.
- integrations:write.
- recommendations:read.
- recommendations:write.
- automations:approve.
- white_label:write.

## Client-level access

Alguns usuários podem acessar apenas clientes específicos.

Exemplo:

- Analista A acessa Cliente 1 e Cliente 2.
- Cliente final acessa apenas relatórios do próprio cliente.
- Admin acessa todos os clientes da organização.

## Regras de autorização

Toda requisição deve validar:

1. Usuário autenticado.
2. Membership ativo.
3. Organização correta.
4. Papel ou permissão.
5. Acesso ao cliente quando aplicável.
6. Estado do plano quando recurso for limitado.

## RLS

Quando usando Supabase, tabelas acessíveis pelo frontend devem aplicar políticas RLS.

Regras:

- organization_id obrigatório para dados de tenant.
- Usuário deve possuir membership ativo.
- Permissões administrativas devem ser validadas no backend.

## Service role

Service role deve ser usada somente no backend e workers. Nunca deve ser enviada ao frontend.

## Ações sensíveis

Exigem permissão elevada:

- Conectar integração.
- Revogar integração.
- Alterar billing.
- Convidar usuário.
- Alterar papéis.
- Aprovar automação externa.
- Excluir cliente.
- Compartilhar relatório publicamente.

## Auditoria

Registrar:

- Quem executou.
- Organização.
- Cliente quando aplicável.
- Ação.
- Data/hora.
- IP quando disponível.
- Resultado.

## Testes obrigatórios

- Usuário sem organização não acessa dados.
- Usuário de outra organização é bloqueado.
- Client Viewer não acessa configurações.
- Analyst não gerencia billing.
- Sales não conecta integrações.
- Owner acessa todos os recursos.

## Evolução futura

- ABAC complementar.
- Permissões customizadas por organização.
- MFA para ações sensíveis.
- Just-in-time access.
- Sessões administrativas temporárias.
- Revisão periódica de acessos.