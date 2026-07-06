# 22 — AI Architecture

## Objetivo

Definir como a camada de IA do SEO20 irá transformar dados coletados por motores técnicos em diagnóstico, estratégia, relatório, proposta comercial e ações assistidas.

## Princípio central

A IA não deve inventar dados. Ela deve interpretar dados reais coletados pelos motores da plataforma.

Regra:

- Coleta: motores, APIs e crawlers.
- Validação: regras determinísticas.
- Interpretação: IA.
- Execução: somente com aprovação humana.

## Componentes

### Strategy Agent

Consolida os dados e define prioridades.

### Report Agent

Escreve o relatório executivo em linguagem comercial.

### Automation Agent

Transforma recomendações aprovadas em ações executáveis.

### SEO Agent

Interpreta problemas técnicos e sugere correções.

### Local SEO Agent

Interpreta dados locais, Google Business e concorrentes de mapa.

### Ads Agent

Analisa Google Ads e Meta Ads.

### Content Agent

Sugere páginas, artigos, FAQs, copies e landing pages.

### Backlink Agent

Classifica oportunidades de autoridade e link building seguro.

## Fluxo de IA

1. Motores coletam dados.
2. Dados são normalizados em JSON.
3. Regras calculam scores preliminares.
4. Agentes recebem dados estruturados.
5. Agentes geram recomendações.
6. Strategy Agent prioriza.
7. Report Agent escreve relatório.
8. Automation Agent prepara ações futuras.

## Saídas estruturadas

Sempre que possível, agentes devem retornar JSON validável.

Exemplo:

```json
{
  "module": "seo",
  "title": "Title da página inicial está fraco",
  "impact": "high",
  "effort": "low",
  "priority": 1,
  "evidence": ["Página inicial não usa a palavra-chave principal"],
  "recommendation": "Reescrever o title incluindo serviço e cidade"
}
```

## Redução de alucinação

- Fornecer dados estruturados.
- Exigir evidência.
- Proibir inventar números.
- Separar fatos de hipóteses.
- Usar validação por schema.
- Salvar prompts versionados.

## Memória

A plataforma deve armazenar:

- Diagnósticos anteriores.
- Recomendações aplicadas.
- Resultados observados.
- Preferências da agência.
- Tom de relatório.
- Base de conhecimento de SEO e tráfego.

## Modelos

No MVP, usar provedor principal via API. Futuramente permitir múltiplos modelos:

- Modelo forte para estratégia e relatório.
- Modelo rápido para classificação.
- Modelo local para tarefas simples.

## Auditoria

Toda saída de IA deve salvar:

- Prompt usado.
- Versão do prompt.
- Modelo.
- Dados de entrada.
- Saída.
- Data.
- Usuário ou job responsável.