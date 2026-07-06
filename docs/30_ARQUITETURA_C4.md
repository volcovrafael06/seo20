# 30 — Arquitetura C4

## Objetivo

Este documento descreve a arquitetura do SEO20 usando o modelo C4: Contexto, Containers, Componentes e Código. O objetivo é permitir que desenvolvedores, analistas e gestores entendam rapidamente como a plataforma será estruturada.

## Nível 1 — Contexto

O SEO20 é uma plataforma SaaS usada por uma agência de marketing para auditar clientes, analisar concorrentes, gerar relatórios e orientar ações de tráfego pago, SEO, SEO local, backlinks, CRO, conteúdo e IA.

### Atores

- Dono da agência.
- Gestor de tráfego.
- Analista de SEO.
- Vendedor.
- Cliente final com acesso restrito.
- Desenvolvedor.
- Sistemas externos.

### Sistemas externos

- Supabase.
- Google Search Console.
- Google Analytics 4.
- Google Ads.
- Google Business Profile.
- Meta Ads.
- Meta Graph API.
- DataForSEO.
- Ahrefs.
- Semrush.
- Moz.
- Majestic.
- WordPress.
- GitHub.
- OpenAI.

## Nível 2 — Containers

### Frontend Web

Aplicação Next.js responsável por dashboard, telas de cliente, auditorias, relatórios e integrações.

### Backend API

Serviço FastAPI responsável por regras de negócio, autenticação, orquestração de auditorias e comunicação com workers.

### Workers

Processos Celery responsáveis por tarefas pesadas, crawlers, integrações, IA e geração de PDF.

### Redis

Broker de filas, cache temporário e controle de locks.

### Supabase

Banco, autenticação, storage, RLS e pgvector.

### Serviços externos

APIs de SEO, Ads, Analytics, redes sociais e IA.

## Nível 3 — Componentes

### Backend API

Componentes principais:

- Auth Middleware.
- Client Service.
- Audit Service.
- Integration Service.
- Recommendation Service.
- Report Service.
- Automation Service.
- Webhook Handler.

### Workers

Componentes:

- Crawler Worker.
- Keyword Worker.
- SERP Worker.
- SEO Worker.
- Local SEO Worker.
- Backlink Worker.
- Ads Worker.
- AI Worker.
- Report Worker.

### Frontend

Componentes:

- AppShell.
- Dashboard.
- Client Pages.
- Audit Pages.
- Report Preview.
- Integration Center.
- Opportunity Center.

## Nível 4 — Código

A implementação deve seguir separação por módulos. Cada domínio deve ter serviço, schemas, rotas e testes próprios.

Exemplo backend:

```txt
app/
├── api/
├── core/
├── services/
├── workers/
├── integrations/
├── schemas/
└── tests/
```

## Fluxo principal

1. Usuário cria cliente.
2. Usuário inicia auditoria.
3. API cria registros no Supabase.
4. API envia jobs para Redis.
5. Workers executam módulos.
6. IA consolida diagnóstico.
7. Report Engine gera PDF.
8. Frontend exibe resultados.

## Decisões importantes

- Supabase será a base de autenticação e dados.
- Auditorias pesadas serão assíncronas.
- IA será interpretativa, não fonte primária de dados.
- Playwright será usado com cautela e preferencialmente em sites autorizados.
- APIs oficiais e provedores especializados devem ser preferidos para dados de SERP e Ads.