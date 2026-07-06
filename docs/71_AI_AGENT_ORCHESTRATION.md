# 71 — AI Agent Orchestration

## Objetivo

Definir como os agentes de IA do SEO20 serão organizados, acionados, monitorados e limitados para gerar recomendações úteis sem comprometer segurança, custo ou rastreabilidade.

## Princípios

- IA deve apoiar decisão, não substituir validação humana em ações críticas.
- Todo agente deve ter escopo claro.
- Toda saída relevante deve ter evidência.
- Toda execução deve ser registrada.
- Custos devem ser controlados por tenant, plano e tipo de tarefa.
- Agentes não devem acessar dados fora da organização.

## Agentes principais

### Audit Agent

Responsável por transformar dados brutos de auditoria em achados estruturados.

Entradas:

- Crawl.
- Métricas técnicas.
- Dados de Search Console.
- Dados de GA4.
- Dados de Ads.
- Dados locais.

Saídas:

- Achados.
- Evidências.
- Severidade.
- Recomendação inicial.

### Strategy Agent

Responsável por priorizar ações e montar plano estratégico.

Entradas:

- Scores.
- Recomendações.
- Dados concorrenciais.
- Objetivos do cliente.
- Restrições comerciais.

Saídas:

- Plano 30/60/90 dias.
- Quick wins.
- Projetos estruturais.
- Riscos.
- Dependências.

### Report Agent

Responsável por transformar dados técnicos em relatório executivo e técnico.

Saídas:

- Sumário executivo.
- Explicações por seção.
- Recomendações contextualizadas.
- Próximos passos.

### Content Agent

Responsável por briefings, clusters, FAQs, pautas e melhorias de conteúdo.

### Automation Agent

Responsável por preparar ações automatizáveis, sempre respeitando regras de aprovação.

Exemplos:

- Criar issue no GitHub.
- Criar rascunho no WordPress.
- Preparar alteração de title/meta.
- Gerar texto de FAQ.

### Sales Agent

Responsável por converter diagnóstico técnico em narrativa comercial, proposta e argumentos para reunião.

## Orquestrador

O Orchestrator coordena a execução dos agentes.

Responsabilidades:

- Definir ordem de execução.
- Validar pré-condições.
- Controlar contexto enviado ao modelo.
- Registrar logs.
- Aplicar limites de custo.
- Lidar com falhas.
- Consolidar respostas.

## Fluxo de auditoria com IA

1. Auditoria é concluída pelos motores determinísticos.
2. Orchestrator seleciona agentes necessários.
3. Audit Agent resume achados.
4. Strategy Agent prioriza ações.
5. Report Agent escreve explicações.
6. Sales Agent prepara narrativa comercial quando solicitado.
7. Automation Agent gera rascunhos quando houver ações possíveis.
8. Sistema salva resultados estruturados.

## Estados de execução

- queued.
- running.
- waiting_dependency.
- completed.
- failed.
- cancelled.
- skipped.

## Estrutura de agent run

Campos sugeridos:

- id.
- organization_id.
- audit_id.
- agent_type.
- model.
- input_hash.
- output_json.
- status.
- cost_estimate.
- tokens_input.
- tokens_output.
- started_at.
- finished_at.
- error_message.

## Guardrails

- Não executar comandos externos sem permissão.
- Não publicar conteúdo automaticamente.
- Não alterar contas de Ads automaticamente.
- Não expor prompts internos.
- Não inventar métricas.
- Não inferir dados financeiros sem indicar estimativa.
- Não misturar dados de tenants.

## Formato de saída

Sempre que possível, agentes devem retornar JSON estruturado com:

- summary.
- findings.
- recommendations.
- evidence.
- confidence.
- next_actions.
- risks.

## Critério de confiança

Cada recomendação deve conter confidence:

- high: evidência forte e baixa ambiguidade.
- medium: evidência suficiente, mas com premissas.
- low: hipótese que exige validação humana.

## Observabilidade

Monitorar:

- Custo por agente.
- Latência.
- Taxa de erro.
- Taxa de retry.
- Tokens por execução.
- Agentes mais caros.
- Organizações com maior consumo.

## Evolução futura

- Planner Agent.
- Critic Agent.
- Multi-model routing.
- Memória por cliente.
- Aprendizado com feedback da agência.
- Execução baseada em eventos.
- Simulação de impacto antes de automação.