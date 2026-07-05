# 12 — Keyword Engine Detalhado

## Objetivo

O Keyword Engine descobre o que os clientes realmente pesquisam, classifica intenção e prioriza oportunidades para SEO, conteúdo, Google Ads e páginas de serviço.

## Entradas

- Segmento do cliente.
- Cidade.
- Estado.
- Região de atendimento.
- Site.
- Serviços informados.
- Concorrentes conhecidos.
- Dados do Search Console quando conectado.

## Fontes de dados

### Google Autocomplete

Usado para sugestões de cauda longa. Exemplos:

- `cortina sorocaba`.
- `cortina sob medida sorocaba`.
- `persiana blackout sorocaba`.

### Related Searches

Coleta buscas relacionadas no final da SERP.

### People Also Ask

Coleta perguntas úteis para FAQ, blog e conteúdo informacional.

### Google Trends

Usado para sazonalidade e crescimento de interesse.

### Google Keyword Planner

Quando houver conta Google Ads conectada, fornecerá volume, CPC e concorrência.

### Google Search Console

Fonte mais valiosa quando disponível. Mostra palavras com impressões reais, CTR e posição média.

### Semrush/Ahrefs/DataForSEO

Usados para volume, dificuldade, SERP, CPC, concorrentes e variações.

## Processo

1. Gerar seeds a partir do segmento.
2. Adicionar modificadores locais.
3. Buscar sugestões.
4. Remover duplicadas.
5. Normalizar acentos e variações.
6. Enriquecer métricas.
7. Classificar intenção.
8. Priorizar.
9. Associar página recomendada.
10. Enviar para SERP Engine.

## Classificação de intenção

- Compra imediata.
- Serviço local.
- Pesquisa informacional.
- Comparação.
- Preço/orçamento.
- Marca.
- Problema/dor.

## Score de prioridade

Fatores:

- Volume.
- Intenção comercial.
- Dificuldade.
- CPC.
- Relevância para o negócio.
- Presença atual do cliente.
- Lacuna contra concorrentes.

Exemplo de fórmula inicial:

`priority = intent_score + volume_score + cpc_score - difficulty_penalty + gap_bonus`

## Saídas

Cada palavra-chave deve gerar:

- Keyword.
- Tipo.
- Intenção.
- Volume.
- CPC.
- Dificuldade.
- Localidade.
- Página atual ou sugerida.
- Ação recomendada.

## Ações recomendadas

- Criar página de serviço.
- Otimizar página existente.
- Criar FAQ.
- Criar artigo.
- Usar em Google Ads.
- Usar como negativa.
- Monitorar.

## Relatório

O relatório deve mostrar as 20 a 50 melhores oportunidades, não uma lista gigante. A lista completa fica no dashboard.