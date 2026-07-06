# 139 — Prompt Registry

## Objetivo

Definir o registro versionado de prompts usados pelos agentes do SEO20.

## Campos do prompt

- prompt_id.
- name.
- agent_type.
- version.
- status.
- model_hint.
- input_schema.
- output_schema.
- created_at.
- updated_at.

## Status

- draft.
- active.
- deprecated.
- archived.

## Regras

- Toda alteração deve criar nova versão.
- Prompts ativos devem ter objetivo claro.
- Saída estruturada deve possuir schema.
- Prompt antigo não deve ser apagado se ainda houver execução vinculada.

## Uso

O Agent Orchestrator deve buscar prompt ativo por agente, tarefa e versão configurada.

## Evolução futura

- Teste A/B de prompts.
- Métricas por versão.
- Biblioteca visual.
- Comparação de saída por prompt.