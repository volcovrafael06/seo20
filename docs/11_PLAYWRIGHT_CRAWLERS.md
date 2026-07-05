# 11 — Playwright Crawlers

## Objetivo

Definir como o SEO20 vai acessar sites, páginas, resultados e elementos públicos para auditoria. O Playwright será usado para renderizar páginas reais, capturar screenshots, medir elementos e coletar HTML quando APIs oficiais não forem suficientes.

## Princípios

1. Preferir APIs oficiais quando disponíveis.
2. Respeitar robots.txt, termos de uso e limites razoáveis.
3. Evitar coleta agressiva.
4. Registrar fonte, data e método da coleta.
5. Nunca coletar dados privados sem autorização.

## Usos principais

### Auditoria de site

- Abrir URL inicial.
- Detectar redirects.
- Capturar HTML renderizado.
- Capturar título, meta tags e headings.
- Capturar screenshots desktop e mobile.
- Extrair links internos.
- Verificar CTAs e formulários.
- Coletar imagens e atributos ALT.

### Auditoria de landing page

- Medir acima da dobra.
- Identificar CTA principal.
- Verificar WhatsApp.
- Verificar formulário.
- Capturar prova social.
- Avaliar legibilidade.

### SERP e Maps

Quando permitido e tecnicamente viável, o Playwright pode auxiliar na inspeção visual, mas o ideal é usar DataForSEO ou APIs especializadas para reduzir risco e aumentar estabilidade.

## Estratégia de crawling do site

### MVP

1. Home.
2. Páginas linkadas no menu.
3. Páginas do sitemap.
4. Limite inicial de 50 URLs por auditoria.

### Evolução

- Crawl incremental.
- Detecção de páginas órfãs.
- Priorização por tráfego do Search Console.
- Priorização por conversão do GA4.

## User agents

Usar user agent claro e não enganoso para auditoria própria quando aplicável. Para sites de clientes, o cliente autoriza a auditoria no cadastro.

## Screenshots

Capturas recomendadas:

- Desktop 1440x1200.
- Mobile 390x1200.
- Full page quando necessário.

Salvar em Supabase Storage no bucket `screenshots`.

## Timeouts

- Navegação: 30 segundos.
- Espera de rede: 10 segundos.
- Screenshot: 15 segundos.

## Dados extraídos por página

- URL final.
- Status HTTP.
- Title.
- Meta description.
- Canonical.
- H1.
- H2.
- H3.
- Links internos.
- Links externos.
- Imagens.
- ALT ausentes.
- Formulários.
- Botões.
- WhatsApp.
- Schema JSON-LD.
- Open Graph.

## Anti-fragilidade

O crawler deve continuar mesmo se uma página falhar. Falhas devem virar evidências no relatório, não interromper toda auditoria.

## Riscos

- Bloqueios por WAF.
- Captchas.
- Sites lentos.
- Conteúdo carregado por JavaScript.
- Páginas com lazy loading.

## Recomendação técnica

Criar uma camada `CrawlerService` com métodos pequenos:

- `fetch_page`.
- `extract_metadata`.
- `extract_headings`.
- `extract_links`.
- `capture_screenshot`.
- `discover_pages`.

Assim o crawler pode ser testado e substituído por outras estratégias no futuro.