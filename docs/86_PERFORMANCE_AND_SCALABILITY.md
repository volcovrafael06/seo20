# 86 — Performance and Scalability

## Objetivo

Definir diretrizes de performance e escalabilidade para o SEO20, garantindo que a plataforma consiga crescer em número de clientes, auditorias, integrações, relatórios e execuções de IA sem degradação crítica.

## Princípios

- Separar processamento síncrono de processamento assíncrono.
- Escalar API, workers e filas de forma independente.
- Evitar consultas pesadas no caminho crítico da interface.
- Cachear dados caros e relativamente estáveis.
- Controlar concorrência de crawlers e integrações externas.
- Medir antes de otimizar.
- Definir limites por tenant e por plano.

## Componentes críticos

- API FastAPI.
- Frontend Next.js.
- PostgreSQL/Supabase.
- Redis.
- Workers Celery.
- Crawlers Playwright.
- Report Engine.
- IA/LLM calls.
- Integrações externas.
- Storage.

## Caminhos críticos

### Login e carregamento inicial

Deve ser rápido e previsível.

Métricas:

- Tempo até dashboard carregado.
- Erro de autenticação.
- Latência da API de sessão.

### Dashboard

Evitar cálculos pesados em tempo real. Usar dados pré-agregados quando possível.

### Execução de auditoria

Auditoria é processo assíncrono e deve informar progresso.

### Geração de relatório

PDF deve ser gerado por worker. Interface apenas consulta status.

### Integrações externas

Sincronizações devem ser assíncronas, idempotentes e com retries.

## Estratégia de escala

### API

Escalar horizontalmente conforme tráfego.

Cuidados:

- Stateless.
- Sem sessões em memória local.
- Rate limit externo ou Redis.
- Healthchecks.

### Workers

Escalar por fila:

- crawl.
- audit.
- reports.
- integrations.
- ai.
- webhooks.

Cada fila pode ter concorrência diferente.

### Banco

Otimizar com:

- Índices corretos.
- Paginação.
- Views materializadas quando necessário.
- Particionamento futuro.
- Read replicas futuras.
- Evitar N+1 queries.

### Redis

Usar para:

- Filas.
- Cache.
- Locks.
- Rate limiting.
- Estado temporário de progresso.

## Métricas de performance

### API

- p50/p95/p99 latency.
- Request rate.
- Error rate.
- CPU/memória.
- Conexões abertas.

### Workers

- Queue depth.
- Tempo médio por job.
- Jobs falhos.
- Retries.
- Jobs presos.

### Banco

- Query latency.
- Queries lentas.
- Locks.
- Conexões.
- CPU.
- IO.

### Frontend

- LCP.
- INP.
- CLS.
- Bundle size.
- Erros JS.

### IA

- Tokens por execução.
- Custo por auditoria.
- Latência por modelo.
- Taxa de fallback.

## Gargalos prováveis

- Crawlers em excesso.
- Geração simultânea de PDFs.
- Consultas analíticas no banco operacional.
- Dashboards sem agregação.
- IA sem cache.
- Integrações externas com rate limit.
- Storage com muitos screenshots.

## Mitigações

- Limitar concorrência por organização.
- Separar filas por tipo de tarefa.
- Cachear resultados de integrações.
- Pré-computar scores.
- Usar jobs idempotentes.
- Paginar endpoints.
- Compactar payloads.
- Gerar relatórios em background.

## SLOs iniciais

Sugestão para MVP:

- API dashboard p95 abaixo de 800ms.
- Criação de auditoria abaixo de 2s.
- Auditoria pequena concluída em até 5 minutos.
- Relatório PDF simples em até 2 minutos.
- Erro 5xx abaixo de 1%.

## Testes de carga

Cenários:

- 10 auditorias simultâneas.
- 100 usuários carregando dashboard.
- 50 PDFs em fila.
- Sincronização diária de integrações.
- Picos de chamadas de IA.

## Estratégia de degradação

Quando houver carga excessiva:

- Priorizar dashboard e leitura.
- Reduzir concorrência de crawlers.
- Pausar jobs não críticos.
- Usar filas com prioridade.
- Adiar relatórios pesados.
- Aplicar rate limit.

## Evolução futura

- Separação OLTP/OLAP.
- Data warehouse dedicado.
- CDN para relatórios/assets.
- Read replicas.
- Workers autoscaling.
- Feature flags para degradação controlada.
- Observabilidade distribuída.
- Load testing contínuo.