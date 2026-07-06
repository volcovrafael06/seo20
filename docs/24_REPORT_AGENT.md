# 24 — Report Agent

## Objetivo

O Report Agent transforma dados e recomendações em um relatório executivo claro, bonito e comercialmente forte.

## Responsabilidades

- Escrever sumário executivo.
- Explicar scores.
- Traduzir problemas técnicos em impacto de negócio.
- Organizar recomendações por prioridade.
- Criar narrativa de diagnóstico.
- Adaptar linguagem ao segmento do cliente.
- Preparar blocos para PDF.

## Entradas

- Dados finais da auditoria.
- Recomendações priorizadas pelo Strategy Agent.
- Scores.
- Concorrentes.
- Gráficos gerados.
- Screenshots.
- Identidade visual da agência.

## Estrutura textual

### Sumário executivo

Deve responder:

- Como está a presença digital da empresa?
- Onde ela está perdendo oportunidades?
- Quais ações devem ser feitas primeiro?
- Qual o potencial de ganho?

### Diagnóstico por módulo

Para cada módulo:

- Situação atual.
- Evidência.
- Impacto.
- Recomendação.
- Prioridade.

### Benchmark

Explicar a diferença entre cliente e concorrentes de forma simples.

### Plano de ação

Separar por 30, 60 e 90 dias.

## Regras de escrita

- Não inventar números.
- Não prometer posição garantida no Google.
- Não usar jargão sem explicar.
- Sempre associar problema técnico a impacto comercial.
- Ser direto.
- Evitar texto inflado.

## Adaptação por segmento

O Report Agent deve adaptar exemplos e linguagem conforme o setor:

- Clínica: foco em agendamentos, confiança e reputação.
- E-commerce: foco em conversão, produtos e ROAS.
- Serviço local: foco em Maps, WhatsApp e avaliações.
- B2B: foco em autoridade, leads e conteúdo.

## Saída

O agente deve gerar blocos estruturados:

- `executive_summary`.
- `module_sections`.
- `competitor_analysis`.
- `action_plan`.
- `commercial_opportunities`.
- `final_recommendation`.

## Integração com PDF

O Report Engine recebe os blocos do Report Agent e aplica no template visual.

## Controle de qualidade

Antes de gerar PDF final, validar:

- Todos os módulos têm texto.
- Não há placeholder.
- Números citados existem nos dados.
- Recomendações possuem evidência.
- Linguagem está clara para dono de empresa.