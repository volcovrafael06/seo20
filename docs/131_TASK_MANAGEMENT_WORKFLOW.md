# 131 — Task Management Workflow

## Objetivo

Definir como recomendações, oportunidades e planos de ação serão transformados em tarefas gerenciáveis dentro do SEO20.

## Entidades

- Recommendation.
- Opportunity.
- Action Plan.
- Task.
- Assignee.
- Status.

## Fluxo

1. Sistema gera recomendação.
2. Usuário revisa.
3. Recomendação vira tarefa.
4. Tarefa recebe prioridade.
5. Tarefa recebe responsável.
6. Execução é acompanhada.
7. Resultado é registrado.

## Campos da tarefa

- id.
- organization_id.
- client_id.
- source_type.
- source_id.
- title.
- description.
- priority.
- status.
- assignee_id.
- due_date.
- created_at.
- updated_at.

## Status

- backlog.
- planned.
- in_progress.
- blocked.
- review.
- done.
- ignored.

## Regras

- Toda tarefa deve ter origem rastreável.
- Mudança de status deve gerar histórico.
- Tarefas críticas devem permitir comentário.
- Tarefas concluídas devem manter evidência.

## Evolução futura

- Kanban.
- SLA por tarefa.
- Integração com GitHub.
- Integração com ClickUp/Trello/Asana.
- Relatório mensal de execução.