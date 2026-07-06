# 70 — Webhooks and Automations

## Objetivo

Definir como o SEO20 enviará eventos para sistemas externos e executará automações internas ou assistidas.

## Webhooks

Webhooks permitem que sistemas externos recebam eventos do SEO20 em tempo quase real.

## Eventos iniciais

- audit.created.
- audit.started.
- audit.completed.
- audit.failed.
- report.generated.
- recommendation.created.
- recommendation.updated.
- integration.connected.
- integration.expired.
- subscription.updated.

## Payload padrão

```json
{
  "id": "event_id",
  "type": "audit.completed",
  "created_at": "timestamp",
  "organization_id": "uuid",
  "data": {}
}
```

## Segurança dos webhooks

- Assinar payload com HMAC.
- Permitir segredo por endpoint.
- Reenviar em caso de falha.
- Registrar tentativas.
- Permitir pausar endpoint.
- Validar HTTPS em produção.

## Retentativas

Política sugerida:

- Tentativa imediata.
- 1 minuto.
- 5 minutos.
- 30 minutos.
- 2 horas.
- 24 horas.

Após falha persistente, marcar endpoint como unhealthy.

## Automações

Automações representam ações disparadas por eventos, regras ou aprovação humana.

## Tipos de automação

### Internas

- Reprocessar auditoria.
- Gerar relatório.
- Enviar notificação.
- Atualizar status.

### Externas

- Criar issue no GitHub.
- Criar rascunho no WordPress.
- Enviar lead para CRM.
- Enviar evento para Slack.
- Enviar dados para BI.

### Assistidas por IA

- Gerar plano de ação.
- Criar briefing.
- Criar proposta.
- Preparar texto de correção.
- Sugerir PR.

## Regra de aprovação

Ações que alteram canais externos ou publicam conteúdo devem exigir aprovação humana.

## Automation states

- draft.
- pending_approval.
- approved.
- running.
- completed.
- failed.
- cancelled.

## Entidades

- automation_rules.
- automation_runs.
- webhook_endpoints.
- webhook_deliveries.
- approval_requests.

## Observabilidade

Cada execução deve registrar:

- Trigger.
- Input.
- Output.
- Status.
- Erro.
- Usuário aprovador.
- Tempo de execução.

## Futuro

- Builder visual de automações.
- Templates por agência.
- Integração com Zapier/Make.
- Webhook marketplace.
- Automação com rollback.
- Políticas avançadas de aprovação.