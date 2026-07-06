# 114 — Audit Engine MVP Spec

## Objetivo

Definir a versão mínima do Audit Engine para validar o SEO20 no primeiro ciclo funcional.

## Entrada

- organization_id.
- client_id.
- website_id.
- URL inicial.
- Profundidade máxima.
- Limite de páginas.

## Coletas mínimas

- Status HTTP.
- Title.
- Meta description.
- H1.
- Canonical.
- Meta robots.
- Links internos.
- Links externos.
- Imagens sem alt.
- Tamanho de página.

## Achados mínimos

- Title ausente.
- Title duplicado.
- Meta description ausente.
- H1 ausente.
- H1 duplicado.
- Página com erro HTTP.
- Link quebrado.
- Canonical ausente.
- Página noindex.
- Imagem sem alt.

## Scores iniciais

- Technical Score.
- Content Basics Score.
- Indexability Score.
- Internal Links Score.

## Saída

- Audit status.
- Páginas processadas.
- Achados.
- Recomendações.
- Score geral.

## Estados

- queued.
- running.
- completed.
- failed.
- cancelled.

## Regras

- Auditoria deve rodar em worker.
- Resultado deve ser persistido.
- Falha parcial deve ser registrada.
- O usuário deve conseguir acompanhar status.

## Evolução futura

- Renderização JavaScript.
- Core Web Vitals.
- Schema.
- Sitemap.
- Robots.
- Hreflang.
- Crawl visual.