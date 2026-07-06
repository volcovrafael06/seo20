# 72 — Prompt Engineering Guide

## Objetivo

Definir padrões de prompts para os agentes de IA do SEO20, garantindo consistência, rastreabilidade, redução de alucinações e melhor controle de custo.

## Princípios

- Prompt deve ter função clara.
- Contexto deve ser mínimo suficiente.
- Saída deve ser estruturada.
- Instruções devem separar fatos, hipóteses e recomendações.
- O agente deve citar evidências internas quando disponíveis.
- O agente não deve inventar dados ausentes.

## Estrutura base de prompt

Todo prompt deve conter:

1. Papel do agente.
2. Objetivo da tarefa.
3. Contexto disponível.
4. Restrições.
5. Critérios de qualidade.
6. Formato de saída.
7. Regras de segurança.

## Template conceitual

```text
Você é o [AGENTE] do SEO20.
Objetivo: [OBJETIVO].
Use somente o contexto fornecido.
Não invente métricas, fontes ou resultados.
Quando uma informação estiver ausente, marque como desconhecida.
Retorne no formato JSON definido.
```

## Separação de contexto

O contexto deve ser enviado em blocos:

- Dados do cliente.
- Dados técnicos.
- Dados de tráfego.
- Dados de concorrência.
- Recomendações existentes.
- Restrições comerciais.
- Histórico relevante.

## Formato JSON recomendado

```json
{
  "summary": "",
  "findings": [],
  "recommendations": [],
  "evidence": [],
  "assumptions": [],
  "risks": [],
  "confidence": "medium"
}
```

## Regras de saída

- Usar linguagem clara.
- Evitar jargão excessivo no relatório executivo.
- Manter precisão técnica na seção técnica.
- Separar recomendação de justificativa.
- Informar quando algo for estimativa.
- Não prometer resultado garantido.

## Prompt para Audit Agent

Objetivo:

- Explicar achados técnicos.
- Classificar severidade.
- Gerar recomendações.

Campos de saída:

- finding_id.
- title.
- description.
- severity.
- evidence.
- recommendation.
- expected_impact.
- confidence.

## Prompt para Strategy Agent

Objetivo:

- Priorizar ações.
- Criar plano por fases.
- Considerar impacto, esforço, urgência e dependências.

Campos de saída:

- phase.
- action.
- rationale.
- dependencies.
- impact.
- effort.
- priority.

## Prompt para Report Agent

Objetivo:

- Transformar achados em linguagem compreensível para decisores.

Regras:

- Não simplificar ao ponto de perder precisão.
- Não omitir riscos críticos.
- Não usar tom alarmista.
- Usar estrutura de relatório.

## Prompt para Automation Agent

Objetivo:

- Preparar rascunhos de ações.

Regras:

- Nunca afirmar que executou ação se apenas criou rascunho.
- Sempre exigir aprovação quando houver publicação externa.
- Gerar diff ou plano quando possível.

## Anti-padrões

Evitar:

- Prompts genéricos demais.
- Contexto excessivo.
- Saída em texto livre para tarefas que exigem estrutura.
- Pedir para o modelo decidir regras de segurança.
- Misturar dados de múltiplos clientes sem separação.
- Instruções contraditórias.

## Controle de alucinação

Medidas:

- Usar retrieved_context explícito.
- Exigir campo assumptions.
- Exigir campo unknowns.
- Validar JSON.
- Validar referências cruzadas.
- Usar Critic Agent em tarefas críticas.

## Versionamento de prompts

Prompts devem ter:

- prompt_id.
- version.
- agent_type.
- created_at.
- changelog.
- owner.

## Métricas de qualidade

- Taxa de JSON válido.
- Taxa de recomendação aceita.
- Taxa de correção manual.
- Custo por execução.
- Tempo médio.
- Feedback dos usuários.

## Evolução futura

- Prompt registry.
- A/B test de prompts.
- Avaliações automáticas.
- Golden datasets.
- Prompt linting.
- Feedback loop por agência.