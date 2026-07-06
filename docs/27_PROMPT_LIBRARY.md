# 27 — Prompt Library

## Objetivo

Centralizar todos os prompts usados pelos agentes do SEO20, com versionamento, formato de saída esperado e regras para reduzir alucinação.

## Princípios

1. Prompts devem ser versionados.
2. Prompts devem receber dados estruturados.
3. Prompts devem exigir evidências.
4. Sempre que possível, a saída deve ser JSON validável.
5. Prompts não devem permitir invenção de métricas.

## Estrutura sugerida

```txt
prompts/
├── strategy/
├── report/
├── seo/
├── local-seo/
├── backlinks/
├── ads/
├── content/
└── automation/
```

## Metadados de cada prompt

Cada prompt deve conter:

- Nome.
- Versão.
- Agente.
- Objetivo.
- Entrada esperada.
- Saída esperada.
- Restrições.
- Exemplos.

## Prompt base de segurança

Todo agente deve seguir:

- Não invente dados.
- Use apenas informações fornecidas ou recuperadas da base.
- Separe fato, inferência e recomendação.
- Se um dado estiver ausente, sinalize.
- Não prometa posição garantida no Google.
- Não recomende spam de backlinks.
- Não execute ação sem aprovação humana.

## Saída estruturada

Exemplo de schema para recomendação:

```json
{
  "module": "seo_local",
  "title": "Categoria principal do Google Business precisa revisão",
  "description": "Texto explicativo",
  "evidence": ["Concorrentes usam categoria mais alinhada"],
  "impact": "high",
  "effort": "low",
  "priority": 1,
  "confidence": "medium",
  "action_type": "manual_review"
}
```

## Prompts principais

### Strategy Agent

Responsável por priorizar recomendações e criar plano de ação.

### Report Agent

Responsável por transformar diagnóstico em texto executivo.

### SEO Agent

Responsável por interpretar auditoria técnica.

### Local SEO Agent

Responsável por interpretar Google Business e mapas.

### Backlink Agent

Responsável por classificar oportunidades e riscos de links.

### Ads Agent

Responsável por analisar campanhas e verba.

### Automation Agent

Responsável por transformar recomendação aprovada em plano executável.

## Validação

Toda saída JSON deve ser validada no backend com Pydantic. Se falhar, o sistema deve solicitar reparo de saída ao modelo.

## Histórico

Salvar em banco:

- prompt_version.
- model.
- input_hash.
- output.
- created_at.

## Evolução

Prompts devem ser avaliados com casos reais e ajustados conforme qualidade das recomendações.