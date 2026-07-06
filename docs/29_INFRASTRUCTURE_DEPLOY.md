# 29 — Infraestrutura e Deploy

## Objetivo

Definir a infraestrutura inicial para rodar o SEO20 em servidor próprio com Docker, Nginx, SSL e serviços separados.

## Ambiente inicial

- VPS Ubuntu 22.04 ou superior.
- Docker.
- Docker Compose.
- Nginx.
- Certbot.
- Supabase Cloud.
- Redis local.
- Backend FastAPI.
- Frontend Next.js.
- Workers Celery.

## Serviços

### frontend

Aplicação Next.js.

### backend

API FastAPI.

### worker_default

Worker Celery para tarefas gerais.

### worker_crawler

Worker Celery para Playwright.

### worker_report

Worker Celery para geração de PDF.

### redis

Broker e cache.

### nginx

Reverse proxy e SSL.

## Domínios sugeridos

- app.seo20.com.br para dashboard.
- api.seo20.com.br para API.
- reports.seo20.com.br opcional para relatórios.

## Docker Compose

O MVP pode usar um único `docker-compose.yml` com serviços:

- frontend.
- backend.
- redis.
- worker.
- nginx.

## Variáveis de ambiente

### Frontend

- NEXT_PUBLIC_SUPABASE_URL.
- NEXT_PUBLIC_SUPABASE_ANON_KEY.
- NEXT_PUBLIC_API_URL.

### Backend

- SUPABASE_URL.
- SUPABASE_SERVICE_ROLE_KEY.
- REDIS_URL.
- OPENAI_API_KEY.
- DATAFORSEO_LOGIN.
- DATAFORSEO_PASSWORD.
- GOOGLE_CLIENT_ID.
- GOOGLE_CLIENT_SECRET.
- META_APP_ID.
- META_APP_SECRET.

## Deploy manual inicial

1. Clonar repositório.
2. Criar `.env`.
3. Rodar migrations no Supabase.
4. Subir containers.
5. Configurar Nginx.
6. Emitir SSL com Certbot.
7. Testar login.
8. Criar primeira organização.
9. Rodar auditoria teste.

## CI/CD futuro

GitHub Actions:

- Lint.
- Testes.
- Build frontend.
- Build backend.
- Docker build.
- Deploy por SSH.

## Backups

- Supabase backup diário.
- Export de Storage semanal.
- Backup de `.env` em cofre seguro.
- Snapshot da VPS antes de grandes atualizações.

## Monitoramento

- Sentry para erros.
- Grafana para métricas.
- Prometheus para workers.
- Uptime Kuma para monitorar app e API.

## Escalabilidade

Quando crescer:

- Separar workers em outra VPS.
- Usar Redis gerenciado.
- Migrar para Supabase Pro.
- Criar filas por tipo.
- Usar CDN para relatórios e assets.
- Separar banco analítico no futuro.

## Checklist de produção

- HTTPS.
- Firewall.
- Fail2ban.
- Backups.
- Logs.
- Monitoramento.
- RLS testado.
- Rate limit na API.
- Secrets fora do repositório.