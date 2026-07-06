# 75 — Model Router and Cost Control

## Objetivo

Definir como o SEO20 selecionará modelos de IA por tarefa, controlará custo, monitorará consumo e evitará uso indevido de recursos caros.

## Problema

Nem toda tarefa precisa do melhor modelo disponível. Algumas tarefas podem ser resolvidas com modelo barato, outras exigem maior capacidade. Sem roteamento e controle, o custo de IA cresce rapidamente.

## Princípios

- Usar o modelo mais barato que resolva a tarefa com qualidade suficiente.
- Reservar modelos fortes para tarefas críticas.
- Aplicar limites por organização, plano e usuário.
- Registrar tokens, custo e latência.
- Permitir fallback.
- Bloquear loops de agente.

## Classes de tarefa

### Simples

Exemplos:

- Reescrever texto curto.
- Classificar severidade simples.
- Gerar título.
- Resumir achado pequeno.

Modelo recomendado:

- Econômico.
- Baixa latência.

### Média

Exemplos:

- Gerar seção de relatório.
- Priorizar recomendações.
- Criar briefing de conteúdo.
- Explicar problema técnico.

Modelo recomendado:

- Intermediário.
- Boa compreensão contextual.

### Complexa

Exemplos:

- Estratégia 30/60/90 dias.
- Diagnóstico multi-canal.
- Proposta comercial.
- Análise concorrencial ampla.

Modelo recomendado:

- Modelo avançado.
- Maior janela de contexto.

### Crítica

Exemplos:

- Automação que pode alterar sistemas externos.
- Sugestão de mudança em Ads.
- Geração de PR.
- Interpretação com impacto financeiro.

Modelo recomendado:

- Avançado + validação.
- Critic Agent.
- Aprovação humana.

## Model Router

Responsabilidades:

- Receber task_type.
- Avaliar plano do tenant.
- Avaliar orçamento disponível.
- Selecionar modelo.
- Aplicar limite de tokens.
- Escolher fallback.
- Registrar decisão.

## Critérios de roteamento

- Tipo de tarefa.
- Complexidade.
- Tamanho do contexto.
- Idioma.
- Necessidade de JSON confiável.
- Latência esperada.
- Custo estimado.
- Plano contratado.
- Histórico de qualidade.

## Estrutura de configuração

Campos sugeridos:

- task_type.
- preferred_model.
- fallback_model.
- max_input_tokens.
- max_output_tokens.
- temperature.
- require_json.
- require_citations.
- allow_expensive_model.

## Controle de custo

### Por organização

- Limite mensal de tokens.
- Limite mensal em moeda.
- Limite de execuções.
- Alertas em 50%, 80% e 100%.

### Por usuário

- Limite diário.
- Limite de tarefas caras.
- Bloqueio de abuso.

### Por auditoria

- Limite total de agentes.
- Limite total de tokens.
- Evitar reprocessamento duplicado.

## Cache

O sistema deve cachear resultados quando:

- Input não mudou.
- Prompt version não mudou.
- Modelo não mudou.
- Resultado ainda está válido.

Usar hash composto:

- prompt_version.
- task_type.
- input_hash.
- model.

## Fallback

Se modelo preferido falhar:

1. Tentar novamente uma vez.
2. Usar fallback compatível.
3. Reduzir contexto se necessário.
4. Marcar qualidade como degradada.
5. Registrar evento.

## Observabilidade

Métricas:

- Custo por organização.
- Custo por agente.
- Custo por auditoria.
- Tokens input/output.
- Latência.
- Taxa de erro.
- Taxa de fallback.
- Taxa de cache hit.

## Billing integration

Consumo de IA deve alimentar:

- Usage records.
- Alertas de plano.
- Limites de trial.
- Relatórios administrativos.

## Segurança

- Não enviar segredos para modelos.
- Redigir tokens/API keys.
- Filtrar dados sensíveis.
- Isolar tenants.
- Registrar provider e modelo.
- Permitir modo privacy-first para clientes sensíveis.

## Regras contra loops

- Limitar número de chamadas por agent run.
- Limitar profundidade de planejamento.
- Exigir aprovação para execução de automação.
- Cancelar tarefa com comportamento repetitivo.

## Evolução futura

- Multi-provider.
- Model benchmarks internos.
- Roteamento por qualidade histórica.
- Otimização automática de custo.
- Modelos locais para tarefas simples.
- Auditoria de prompts caros.
- Dashboard de FinOps de IA.