# 79 — Deployment Architecture

## Objetivo

Definir a arquitetura de deployment do SEO20 para ambientes de desenvolvimento, staging e produção.

## Componentes

- Frontend Next.js.
- Backend FastAPI.
- Workers Celery.
- Scheduler.
- Redis.
- Supabase PostgreSQL.
- Storage.
- Nginx ou proxy gerenciado.
- Serviços externos.

## Ambientes

### Local

Usado por desenvolvedores.

Componentes:

- Frontend local.
- Backend local.
- Redis local via Docker.
- Supabase local ou projeto remoto de dev.
- Workers locais.

### Staging

Usado para homologação.

Características:

- Dados fictícios ou anonimizados.
- Integrações em sandbox quando possível.
- Deploy automatizado.
- Testes smoke.
- URLs separadas.

### Production

Ambiente real.

Características:

- Alta disponibilidade progressiva.
- Backups.
- Monitoramento.
- Alertas.
- Controle de acesso.
- Segredos protegidos.

## Topologia inicial

Para MVP:

- Frontend em Vercel ou ambiente equivalente.
- Backend em container gerenciado.
- Workers em container separado.
- Redis gerenciado ou container dedicado.
- Supabase para banco, auth e storage.

## Topologia escalável

Em fase avançada:

- Load balancer.
- Backend com múltiplas réplicas.
- Workers separados por fila.
- Redis gerenciado.
- Banco com réplicas de leitura.
- Storage com CDN.
- Observabilidade centralizada.

## Serviços do backend

### API

Responsável por:

- Autenticação de requests.
- Regras de negócio.
- CRUD.
- Disparo de auditorias.
- Consulta de resultados.
- Geração de relatórios.

### Worker

Responsável por:

- Crawls.
- Processamento de auditoria.
- Integrações demoradas.
- Geração de PDF.
- Chamadas de IA.
- Reprocessamentos.

### Scheduler

Responsável por:

- Auditorias recorrentes.
- Sincronizações.
- Webhook retries.
- Tarefas de limpeza.

## Filas

Filas sugeridas:

- audit.
- crawl.
- integrations.
- reports.
- ai.
- webhooks.
- maintenance.

## Variáveis de ambiente

Separar por ambiente:

- DATABASE_URL.
- SUPABASE_URL.
- SUPABASE_ANON_KEY.
- SUPABASE_SERVICE_ROLE_KEY.
- REDIS_URL.
- STORAGE_BUCKET.
- AI_PROVIDER_KEYS.
- GOOGLE_CLIENT_ID.
- GOOGLE_CLIENT_SECRET.
- META_APP_ID.
- META_APP_SECRET.

## Rede

- Backend deve acessar banco e Redis.
- Workers devem acessar banco, Redis e APIs externas.
- Frontend não deve acessar service role.
- APIs administrativas devem exigir autenticação forte.

## Storage

Buckets sugeridos:

- reports.
- screenshots.
- exports.
- brand-assets.
- temp.

Paths devem incluir organization_id para isolamento.

## Escalabilidade

Escalar separadamente:

- API por tráfego.
- Workers por volume de auditorias.
- Redis por filas.
- Banco por carga analítica/transacional.
- Storage por relatórios e screenshots.

## Observabilidade

Monitorar:

- API latency.
- Error rate.
- Queue depth.
- Worker runtime.
- PDF failures.
- Crawl failures.
- Banco CPU/conexões.
- Redis memory.
- Custo de IA.
- Custo de APIs externas.

## Segurança

- HTTPS obrigatório.
- Segredos fora do código.
- Service role apenas no backend.
- CORS restrito.
- Rate limit.
- Logs sem segredos.
- Backups protegidos.

## Estratégia de release

Fases:

1. Deploy staging.
2. Testes smoke.
3. Aprovação.
4. Deploy produção.
5. Monitoramento.
6. Rollback se necessário.

## Evolução futura

- Kubernetes.
- Blue/green deploy.
- Multi-region.
- CDN para assets e relatórios.
- WAF.
- Read replicas.
- Separação OLTP/OLAP.
- Workers por especialidade.