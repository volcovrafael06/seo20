# 28 — Segurança e Observabilidade

## Objetivo

Definir práticas de segurança, logs, auditoria, monitoramento e alertas da plataforma SEO20.

## Segurança de autenticação

- Usar Supabase Auth.
- Validar JWT no backend.
- Aplicar RLS no banco.
- Usar roles por organização.
- Separar acesso interno, analista e cliente.

## Segredos

Nunca expor no frontend:

- Supabase service role.
- Tokens OAuth.
- Chaves de API.
- Credenciais de crawlers.
- Webhook secrets.

Armazenamento:

- Variáveis de ambiente no servidor.
- Cofre de segredos no futuro.
- Criptografia para tokens persistidos.

## Permissões

Papéis recomendados:

- owner.
- admin.
- strategist.
- analyst.
- sales.
- client_viewer.

## Auditoria de ações

Toda ação sensível deve gerar log:

- Login.
- Criação de cliente.
- Geração de relatório.
- Conexão de integração.
- Aprovação de automação.
- Execução de alteração.
- Download de relatório.

## Logs estruturados

Formato JSON com:

- timestamp.
- level.
- service.
- organization_id.
- user_id.
- client_id.
- audit_id.
- task_type.
- message.
- duration_ms.
- error.

## Observabilidade

Ferramentas:

- Sentry para erros de frontend e backend.
- Prometheus para métricas.
- Grafana para dashboards.
- Logs do Docker para MVP.

## Métricas principais

- Auditorias criadas.
- Auditorias concluídas.
- Tempo médio por auditoria.
- Falhas por módulo.
- Uso de IA.
- Custo por auditoria.
- PDFs gerados.
- Jobs em fila.
- Tempo de resposta da API.

## Alertas

Criar alertas para:

- Erro recorrente em worker.
- Fila acumulada.
- Falha de geração de PDF.
- API externa fora.
- Uso excessivo de IA.
- Erro de autenticação incomum.
- Falha de backup.

## Backups

- Backup diário do Supabase.
- Backup de Storage para relatórios críticos.
- Exportação periódica de dados sensíveis.
- Teste de restauração mensal.

## LGPD

Considerar:

- Finalidade clara do tratamento.
- Exclusão de dados mediante solicitação.
- Controle de acesso.
- Minimização de dados.
- Registro de consentimento para integrações.

## Segurança em automações

- Aprovação humana obrigatória.
- Logs de antes/depois.
- Permissão por função.
- Rollback quando possível.
- Modo rascunho por padrão.

## Checklist mínimo de produção

- HTTPS ativo.
- RLS habilitado.
- Service role fora do frontend.
- Logs sem tokens.
- Backups ativos.
- Monitoramento básico.
- Política de permissões testada.