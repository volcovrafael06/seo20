# 43 — Event Driven Architecture

## Objetivo

Definir como o SEO20 registrará eventos de negócio para auditoria, rastreabilidade, automações e análise histórica.

## Princípio

Toda mudança importante deve gerar um evento. Eventos não substituem tabelas principais, mas criam histórico confiável.

## Eventos principais

- `OrganizationCreated`
- `UserInvited`
- `ClientCreated`
- `AuditCreated`
- `AuditStarted`
- `AuditTaskCompleted`
- `AuditFailed`
- `AuditCompleted`
- `RecommendationCreated`
- `ReportGenerated`
- `IntegrationConnected`
- `IntegrationExpired`
- `AutomationDrafted`
- `AutomationApproved`
- `AutomationExecuted`
- `AutomationFailed`

## Estrutura do evento

Campos:

- id.
- organization_id.
- user_id.
- event_type.
- aggregate_type.
- aggregate_id.
- payload jsonb.
- created_at.

## Usos

- Timeline da auditoria.
- Auditoria de segurança.
- Reprocessamento futuro.
- Notificações.
- Métricas.
- Automação.

## Event Bus no MVP

No MVP, eventos podem ser gravados diretamente no PostgreSQL.

## Evolução futura

Quando a escala exigir:

- Redis Streams.
- RabbitMQ.
- Kafka.
- Webhooks externos.
- Processadores assíncronos por evento.

## Regras

- Eventos são imutáveis.
- Não armazenar segredos no payload.
- Payload deve ser pequeno.
- Eventos críticos devem ser transacionais quando possível.

## Exemplo

```json
{
  "event_type": "AuditCompleted",
  "aggregate_type": "audit",
  "aggregate_id": "uuid",
  "payload": {
    "score_general": 78,
    "report_id": "uuid"
  }
}
```