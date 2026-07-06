# 132 — Approval Workflow

## Objetivo

Definir o fluxo de aprovação para ações que podem impactar cliente, relatório, conteúdo, integrações ou sistemas externos.

## Quando exigir aprovação

- Publicar conteúdo.
- Alterar página externa.
- Gerar proposta para cliente.
- Compartilhar relatório.
- Criar tarefa em ferramenta externa.
- Aplicar recomendação crítica.
- Executar automação assistida.

## Estados

- draft.
- pending_approval.
- approved.
- rejected.
- executed.
- cancelled.

## Papéis

- Solicitante.
- Aprovador.
- Executor.
- Auditor.

## Dados da aprovação

- id.
- organization_id.
- client_id.
- requested_by.
- approved_by.
- action_type.
- payload.
- status.
- reason.
- created_at.
- decided_at.

## Regras

- Toda aprovação deve ter contexto claro.
- Aprovação deve registrar decisão.
- Payload aprovado não deve mudar sem nova aprovação.
- Ações rejeitadas devem registrar motivo opcional.

## Evolução futura

- Aprovação em múltiplos níveis.
- Aprovação pelo cliente final.
- Expiração automática.
- Templates de aprovação por tipo de ação.