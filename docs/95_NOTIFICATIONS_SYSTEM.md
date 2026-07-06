# 95 — Notifications System

## Objetivo

Definir o sistema de notificações do SEO20 para informar usuários sobre eventos relevantes, falhas, relatórios, limites, integrações e ações pendentes.

## Canais

- In-app.
- E-mail.
- Webhook.
- Slack futuro.
- WhatsApp futuro.

## Tipos de notificação

### Operacionais

- Auditoria concluída.
- Auditoria falhou.
- Relatório gerado.
- Integração expirada.
- Job preso.

### Comerciais

- Limite de plano atingido.
- Trial próximo do fim.
- Pagamento falhou.
- Upgrade recomendado.

### Segurança

- Novo login.
- Alteração de papel.
- Integração revogada.
- Link de relatório compartilhado.

### Ações pendentes

- Automação aguardando aprovação.
- Proposta pronta para revisão.
- Relatório pronto para envio.

## Preferências

Usuário deve poder configurar:

- Canais ativos.
- Frequência.
- Tipos de evento.
- Resumo diário/semanal.

## Estrutura de evento

Campos:

- id.
- organization_id.
- user_id.
- notification_type.
- channel.
- title.
- body.
- status.
- metadata.
- created_at.
- read_at.
- sent_at.

## Estados

- pending.
- sent.
- read.
- failed.
- dismissed.

## Templates

Cada notificação deve ter template versionado por canal.

Exemplos:

- audit_completed_v1.
- report_ready_v1.
- integration_expired_v1.
- usage_limit_reached_v1.

## Regras

- Notificações não devem expor dados de outro tenant.
- E-mails devem respeitar preferências.
- Eventos críticos podem ignorar resumo e ser imediatos.
- Falhas recorrentes devem ser agrupadas.

## Evolução futura

- Central de notificações.
- Resumo inteligente por IA.
- Digest semanal.
- Notificações por cliente.
- Integração Slack/Teams.
- WhatsApp para agências.