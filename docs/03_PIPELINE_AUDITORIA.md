# 03 — Pipeline de Auditoria

## Objetivo

Definir o processo completo que transforma dados básicos de uma empresa em diagnóstico, score, recomendações, relatório PDF e plano de ação.

## Entrada mínima

- Nome da empresa.
- Site.
- Cidade.
- Estado.
- Segmento.
- Telefone/WhatsApp.
- Redes sociais conhecidas.
- Região de atendimento.

## Etapa 1 — Normalização

O sistema valida URL, domínio, HTTPS, redirects, versão com ou sem www, sitemap, robots.txt e páginas principais. Também tenta descobrir redes sociais, Google Business Profile e canais de anúncio.

## Etapa 2 — Pesquisa de palavras-chave

Fontes:

- Google Autocomplete.
- Related Searches.
- People Also Ask.
- Google Trends.
- Google Keyword Planner.
- Google Search Console.
- Semrush.
- Ahrefs.
- DataForSEO.

Classificação:

- Intenção de compra.
- Intenção informacional.
- Volume.
- Dificuldade.
- CPC.
- Localidade.
- Prioridade.

## Etapa 3 — Descoberta de concorrentes

Para cada palavra-chave relevante, o sistema pesquisa:

- Top 20 orgânico.
- Top 20 Google Maps.
- Anunciantes Google Ads quando disponível.
- Páginas que aparecem em featured snippets ou perguntas.

A frequência de aparição define os concorrentes reais. Exemplo: se uma empresa aparece em 18 de 30 buscas relevantes, ela é concorrente prioritária.

## Etapa 4 — Auditoria do site

- HTML.
- Title.
- Meta description.
- Headings.
- Canonical.
- Schema.
- Open Graph.
- Imagens.
- ALT.
- Links internos.
- Links quebrados.
- Velocidade.
- Mobile.
- Indexabilidade.

## Etapa 5 — SEO Local

- Google Business Profile.
- Categorias.
- Serviços.
- Produtos.
- Fotos.
- Reviews.
- Nota.
- Frequência de avaliações.
- Horário.
- Postagens.
- Q&A.
- Áreas de atendimento.

## Etapa 6 — Backlinks

- Domínios de referência.
- Backlinks totais.
- Follow/nofollow.
- Anchor text.
- Autoridade.
- Toxicidade.
- Link Gap contra concorrentes.
- Backlinks perdidos.
- Menções sem link.

## Etapa 7 — Ads

Com autorização do cliente:

- Google Ads.
- Meta Ads.
- Conversões.
- Pixel.
- Eventos.
- Públicos.
- Criativos.
- CPC.
- CPM.
- CTR.
- CPA.
- ROAS.
- Verbas desperdiçadas.

## Etapa 8 — Consolidação por IA

A IA recebe dados estruturados e gera:

- Diagnóstico executivo.
- Oportunidades.
- Riscos.
- Prioridades.
- Plano 30/60/90 dias.
- Texto comercial.
- Sugestão de proposta.

## Etapa 9 — Geração de relatório

O Report Engine monta HTML profissional com capa, gráficos, tabelas, screenshots, benchmark e plano. Depois exporta PDF e salva no Supabase Storage.

## Etapa 10 — Automação futura

Após aprovação humana, a plataforma poderá criar tarefas, abrir PRs, corrigir páginas, gerar landing pages, montar campanhas e sugerir backlinks.