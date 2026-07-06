# 93 — Admin Panel

## Objetivo

Definir o painel administrativo do SEO20 para operação interna, suporte, gestão de tenants, observabilidade e controle de planos.

## Usuários

- Super admin.
- Suporte.
- Operação técnica.
- Financeiro.
- Produto.

## Módulos

### Organizações

- Listar organizações.
- Ver plano.
- Ver status.
- Ver uso.
- Ajustar limites enterprise.
- Suspender/reativar quando aplicável.

### Usuários

- Consultar usuários.
- Ver memberships.
- Ver último acesso.
- Auxiliar suporte.

### Billing

- Plano atual.
- Status de assinatura.
- Histórico de pagamentos.
- Consumo.
- Limites.

### Auditorias

- Buscar auditorias.
- Ver status.
- Reprocessar.
- Ver falhas.
- Ver duração.

### Workers e filas

- Queue depth.
- Jobs falhos.
- Jobs presos.
- Reprocessamento manual.

### Integrações

- Status por tenant.
- Tokens expirados.
- Erros recorrentes.
- Última sincronização.

### Logs

- Audit logs.
- Erros técnicos.
- Eventos críticos.
- Webhook deliveries.

## Segurança

- Acesso restrito.
- MFA futuro.
- Logs obrigatórios.
- Permissões administrativas separadas.
- Nenhum segredo deve ser exibido em texto claro.

## Funcionalidades críticas

- Impersonation somente com controle forte e log explícito.
- Reprocessamento de jobs.
- Ajuste temporário de limites.
- Revogação de integrações problemáticas.
- Exportação de diagnóstico.

## Regras

- Toda ação administrativa deve gerar audit log.
- Ações destrutivas exigem confirmação.
- Suporte não deve alterar billing sem permissão.
- Painel admin não deve ser acessível por tenants.

## Evolução futura

- Painel de custos.
- Painel de qualidade de IA.
- Gestão de incidentes.
- Feature flags por tenant.
- Health score interno por organização.