# 10 — Workers, Redis e Celery

## Objetivo

Definir a arquitetura assíncrona do SEO20. Auditorias envolvem crawlers, chamadas externas, IA, geração de PDF e processamento pesado. Essas operações não devem rodar diretamente na API FastAPI.

## Componentes

### Redis

Responsável por:

- Broker das filas Celery.
- Cache temporário.
- Controle de locks.
- Armazenamento de progresso rápido.

### Celery Workers

Responsáveis por executar tarefas pesadas:

- Crawling de site.
- Pesquisa SERP.
- Pesquisa Google Maps.
- Coleta de palavras-chave.
- Análise de backlinks.
- Chamada para APIs externas.
- Consolidação por IA.
- Geração de relatórios PDF.

## Tipos de fila

### audit_default

Fila geral para tarefas comuns.

### audit_crawler

Fila para tarefas Playwright e scraping controlado.

### audit_external_api

Fila para Semrush, Ahrefs, DataForSEO, Google APIs, Meta APIs e similares.

### audit_ai

Fila para análise por IA e geração de recomendações.

### audit_report

Fila para renderização de HTML, gráficos e PDF.

## Tarefas principais

- `normalize_client_domain`
- `crawl_site_pages`
- `collect_keyword_suggestions`
- `collect_serp_results`
- `collect_maps_results`
- `audit_technical_seo`
- `audit_local_seo`
- `audit_backlinks`
- `audit_google_ads`
- `audit_meta_ads`
- `generate_strategy_recommendations`
- `generate_pdf_report`

## Ciclo de vida de uma auditoria

1. API cria registro em `audits`.
2. API cria registros em `audit_tasks`.
3. API dispara job inicial no Celery.
4. Worker executa tarefas em cadeia.
5. Cada tarefa atualiza progresso.
6. Ao finalizar, Strategy Agent consolida diagnóstico.
7. Report Engine gera PDF.
8. Auditoria muda para `completed`.

## Status possíveis

- `pending`.
- `running`.
- `done`.
- `failed`.
- `skipped`.
- `waiting_credentials`.

## Retentativas

Política recomendada:

- Crawlers: até 2 tentativas.
- APIs externas: até 3 tentativas com backoff.
- IA: até 2 tentativas.
- PDF: até 2 tentativas.

## Idempotência

Cada task deve ser idempotente. Se for executada novamente, deve atualizar ou substituir dados da mesma auditoria sem duplicar resultados críticos.

## Locks

Usar lock por `audit_id + task_type` para evitar execução duplicada.

## Observabilidade

Cada worker deve registrar:

- audit_id.
- task_type.
- tempo de execução.
- status final.
- erro resumido.
- quantidade de dados coletados.

## Escalabilidade

No MVP, todos os workers podem rodar no mesmo servidor. Em produção, separar workers por tipo de fila:

- 1 worker para API externa.
- 1 worker para crawler.
- 1 worker para IA.
- 1 worker para PDF.

## Segurança

Workers podem usar service role do Supabase, mas apenas no backend. Nunca expor service role no frontend ou em logs.