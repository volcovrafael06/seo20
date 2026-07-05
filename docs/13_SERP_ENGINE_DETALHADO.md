# 13 — SERP Engine Detalhado

## Objetivo

O SERP Engine identifica quem realmente compete com o cliente nas buscas orgânicas e locais. Ele não depende apenas de concorrentes informados pelo cliente; ele descobre os concorrentes reais a partir das páginas que aparecem no Google.

## Entradas

- Lista de palavras-chave priorizadas.
- Cidade e região.
- Segmento.
- Domínio do cliente.
- Localização simulada quando aplicável.

## Fontes recomendadas

### DataForSEO

Fonte ideal para produção, pois fornece SERP orgânico, local pack, maps e dados estruturados via API.

### Google Custom Search API

Pode ser usada como apoio, mas tem limitações de cobertura e formato.

### Playwright

Uso auxiliar para inspeção visual, screenshots e validações. Não deve ser a fonte principal em escala.

## Coleta orgânica

Para cada keyword:

1. Consultar SERP na localização definida.
2. Capturar Top 20 orgânico.
3. Ignorar anúncios.
4. Salvar title, URL, domínio, snippet e posição.
5. Marcar features especiais quando houver.

## Coleta local

Para buscas locais:

1. Capturar Local Pack.
2. Capturar resultados do Google Maps quando possível.
3. Salvar nome, nota, avaliações, categoria, endereço parcial, telefone e URL.
4. Consolidar concorrentes por frequência.

## Consolidação de concorrentes

Um concorrente é priorizado quando aparece repetidamente em várias palavras-chave importantes.

Métricas:

- Frequência orgânica.
- Frequência Maps.
- Posição média.
- Número de keywords onde aparece.
- Tipo de página ranqueada.
- Força local.

## Exemplo

Se um concorrente aparece em:

- 12 keywords orgânicas.
- 8 resultados de Maps.
- Posição média 3.2.

Ele deve ser classificado como concorrente prioritário.

## Saídas

- Lista de concorrentes reais.
- SERP por keyword.
- Oportunidades de conteúdo.
- Keywords onde o cliente não aparece.
- Páginas concorrentes mais fortes.
- Intenções dominadas pelos concorrentes.

## Análise no relatório

O relatório deve responder:

- Quem aparece antes do cliente?
- Para quais buscas?
- Com qual tipo de página?
- O que essas páginas têm em comum?
- O que o cliente precisa criar ou corrigir?

## Cuidados

- Não confundir anúncio com orgânico.
- Não misturar concorrente nacional com local quando a busca é local.
- Considerar localização do usuário.
- Salvar data da coleta, pois SERP muda com frequência.

## Evolução futura

- Monitoramento diário/semanal de posições.
- Alertas de queda.
- Histórico por keyword.
- Share of Search.
- Share of Local Pack.