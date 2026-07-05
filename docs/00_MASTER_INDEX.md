# SEO20 — Índice Mestre

## Visão do produto

SEO20 é uma plataforma SaaS para agência de tráfego pago e orgânico. O sistema audita empresas, compara concorrentes, pesquisa palavras-chave, analisa backlinks, SEO técnico, SEO local, Google Business Profile, Google Ads, Meta Ads, redes sociais, CRO, branding e presença em mecanismos de IA.

O objetivo é transformar a venda da agência em um processo consultivo baseado em dados: o cliente informa site, cidade, segmento e canais conectados; a plataforma coleta dados, gera diagnóstico, calcula scores e exporta um relatório PDF executivo com plano de ação.

## Estrutura da documentação

1. `01_VISAO_GERAL.md` — produto, público, proposta de valor e modelo comercial.
2. `02_ARQUITETURA.md` — arquitetura técnica, serviços, agentes e fluxo geral.
3. `03_PIPELINE_AUDITORIA.md` — processo completo de auditoria ponta a ponta.
4. `04_SUPABASE_MODELO_DADOS.md` — banco, tabelas, RLS e storage.
5. `05_MOTORES.md` — motores de SEO, palavras-chave, concorrentes, backlinks e Ads.
6. `06_RELATORIOS_PDF.md` — estrutura dos relatórios, gráficos, layout e exportação.
7. `07_ROADMAP.md` — fases de desenvolvimento e prioridades.

## Estrutura do repositório

```txt
seo20/
├── README.md
├── docs/
├── backend/
├── frontend/
├── database/
├── docker/
├── agents/
├── prompts/
└── diagrams/
```

## Stack principal

- Frontend: Next.js, React, TypeScript, Tailwind CSS.
- Backend: Python, FastAPI.
- Banco/Auth/Storage: Supabase.
- Vetores: pgvector.
- Filas: Redis + Celery.
- Crawlers: Playwright.
- Relatórios: HTML/CSS para PDF via Playwright ou WeasyPrint.
- Deploy: VPS Ubuntu, Docker Compose, Nginx e Certbot.
- Observabilidade: Sentry, Prometheus e Grafana.

## Integrações previstas

- Google Search Console.
- Google Analytics 4.
- Google Ads API.
- Google Business Profile API.
- PageSpeed Insights.
- Lighthouse.
- Meta Marketing API.
- Meta Graph API.
- DataForSEO.
- Semrush.
- Ahrefs.
- Moz.
- Majestic.
- Open PageRank.
- Microsoft Clarity.
- WordPress REST API.
- GitHub.
- OpenAI.

## Resultado esperado

A plataforma deve permitir que a agência gere um diagnóstico profissional em minutos, com dados, gráficos, prints, scores, análise de concorrentes, oportunidades e plano de ação de 30, 60 e 90 dias. Na segunda fase, o sistema deve executar correções mediante aprovação humana.