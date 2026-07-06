# 88 — Queue Architecture

## Objetivo

Definir a arquitetura de filas do SEO20 para processar auditorias, crawls, integrações, relatórios, IA, webhooks e tarefas recorrentes de forma assíncrona, escalável e resiliente.

## Princípios

- Tarefas demoradas não devem bloquear requisições HTTP.
- Cada tipo de tarefa deve ter fila apropriada.
- Jobs devem ser idempotentes sempre que possível.
- Falhas devem ser rastreáveis.
- Retentativas devem ter limite.
- Concorrência deve ser controlada por tipo de carga.
- Estado final deve ser persistido no banco.

## Tecnologia inicial

- Redis como broker.
- Celery como executor de tarefas.
- PostgreSQL como fonte de estado persistente.

## Filas sugeridas

### audit

Processamento principal de auditorias.

Tarefas:

- Consolidar dados.
- Calcular scores.
- Criar recomendações.
- Finalizar auditoria.

### crawl

Coleta técnica de páginas.

Tarefas:

- Crawl do site.
- Screenshot.
- Coleta de HTML.
- Verificação de links.
- Extração de metadados.

### integrations

Sincronizações externas.

Tarefas:

- Google Search Console.
- GA4.
- Google Ads.
- Meta Ads.
- Google Business Profile.
- DataForSEO.

### reports

Geração de relatórios e PDFs.

Tarefas:

- Montar payload.
- Renderizar HTML.
- Gerar PDF.
- Salvar storage.
- Atualizar status.

### ai

Execuções de agentes e modelos.

Tarefas:

- Audit Agent.
- Strategy Agent.
- Report Agent.
- Sales Agent.
- Content Agent.
- Automation Agent.

### webhooks

Entregas e retentativas de webhooks.

### maintenance

Tarefas de limpeza, expiração, reindexação e manutenção.

## Modelo de job

Campos sugeridos:

- id.
- organization_id.
- job_type.
- queue_name.
- status.
- payload.
- idempotency_key.
- attempts.
- max_attempts.
- scheduled_at.
- started_at.
- finished_at.
- error_message.
- created_at.

## Estados

- queued.
- scheduled.
- running.
- completed.
- failed.
- retrying.
- cancelled.
- dead_letter.

## Idempotência

Jobs devem possuir idempotency_key quando houver risco de duplicidade.

Exemplos:

- auditoria:{audit_id}:finalize
- report:{report_id}:generate
- integration:{integration_id}:sync:{date}
- webhook:{event_id}:{endpoint_id}

## Retentativas

Política sugerida:

- Erros temporários: retry com backoff.
- Erros de validação: falha definitiva.
- Erros de autenticação: marcar integração como expirada.
- Rate limit: reagendar respeitando janela.

## Dead letter

Jobs que excederem tentativas devem ir para estado dead_letter e ficar disponíveis para inspeção e reprocessamento manual.

## Concorrência

Controlar por:

- Fila.
- Organização.
- Tipo de tarefa.
- Plano.
- Domínio alvo.

Exemplo:

- Limitar crawls simultâneos por domínio.
- Limitar IA simultânea por organização.
- Limitar PDFs simultâneos globalmente.

## Prioridade

Algumas filas podem ter prioridades:

- Produção interativa.
- Auditorias pagas.
- Relatórios solicitados pelo usuário.
- Sincronizações recorrentes.
- Manutenção.

## Agendamento

Scheduler deve disparar:

- Auditorias recorrentes.
- Sincronizações diárias.
- Retentativas de webhooks.
- Limpeza de arquivos temporários.
- Reindexação de embeddings.

## Observabilidade

Monitorar:

- Queue depth.
- Tempo em fila.
- Tempo de execução.
- Falhas por job_type.
- Retries.
- Dead letters.
- Workers ativos.
- Jobs presos.

## Segurança

- Payload não deve conter segredos em texto claro.
- Jobs devem validar organization_id.
- Worker deve validar permissões operacionais.
- Logs devem redigir dados sensíveis.

## Reprocessamento

Deve existir mecanismo para:

- Reprocessar job específico.
- Reprocessar auditoria.
- Reprocessar relatório.
- Reprocessar integração por período.
- Cancelar jobs pendentes.

## Anti-padrões

- Executar crawl em request HTTP.
- Não persistir status de job.
- Retry infinito.
- Payload sem idempotência.
- Misturar todos os jobs em uma fila única.
- Não separar tarefas caras.

## Evolução futura

- Redis Streams.
- RabbitMQ.
- Kafka.
- Workers autoscaling.
- Prioridades avançadas.
- Dashboard operacional de filas.
- SLA por fila.
- Backpressure automático.