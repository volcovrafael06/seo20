# 02 — Arquitetura Técnica

## Visão geral

A arquitetura do SEO20 será modular, baseada em frontend web, API central, workers assíncronos, banco Supabase e serviços externos. Auditorias pesadas devem rodar em fila para evitar travar a aplicação.

## Fluxo macro

Usuário acessa o dashboard Next.js. O dashboard chama a API FastAPI. A API valida autenticação no Supabase, cria uma auditoria e envia tarefas para a fila Redis. Os workers Celery executam crawlers Playwright, chamadas para APIs externas, análise por IA e geração do PDF. Os resultados são salvos no Supabase e os arquivos no Supabase Storage.

## Camadas

### Frontend

- Next.js com App Router.
- React + TypeScript.
- Tailwind CSS.
- Componentes de dashboard.
- Gráficos com Recharts ou ECharts.
- Autenticação via Supabase Auth.

### Backend

- FastAPI.
- APIs REST.
- Webhooks.
- Orquestração de auditorias.
- Controle de integrações.
- Geração de jobs assíncronos.

### Workers

- Celery.
- Redis como broker.
- Execução de crawlers.
- Consumo de APIs externas.
- Processamento de relatórios.
- Chamadas para IA.

### Banco

- Supabase PostgreSQL.
- RLS para segurança multiempresa.
- pgvector para memória e análise semântica.
- Supabase Storage para PDFs, screenshots e exports.

### IA

A IA não deve substituir validações técnicas. Ela deve consolidar dados coletados por ferramentas reais e transformar em diagnóstico, plano de ação, priorização e texto executivo.

## Agentes

- Crawler Agent.
- Keyword Agent.
- Competitor Agent.
- SEO Agent.
- Local SEO Agent.
- Backlink Agent.
- Ads Agent.
- Social Agent.
- CRO Agent.
- GEO Agent.
- Strategy Agent.
- Report Agent.
- Automation Agent.

## Princípios

1. Coletar dados reais antes de gerar recomendação.
2. Separar coleta, análise, interpretação e relatório.
3. Salvar histórico de toda auditoria.
4. Permitir reprocessar módulos isolados.
5. Manter logs para auditoria e rastreabilidade.
6. Nunca executar correções sem aprovação humana.

## Deploy inicial

- VPS Ubuntu 22.04 ou superior.
- Docker Compose.
- Nginx como reverse proxy.
- Certbot para SSL.
- Supabase Cloud inicialmente.
- Redis no próprio servidor.
- Workers escaláveis por quantidade de auditorias.