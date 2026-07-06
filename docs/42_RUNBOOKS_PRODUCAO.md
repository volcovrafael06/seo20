# 42 — Runbooks de Produção

## Objetivo

Definir procedimentos operacionais para incidentes comuns em produção.

## Incidente: API indisponível

### Sintomas

- Frontend não carrega dados.
- Erro 502/503 no Nginx.
- Healthcheck falhando.

### Ações

1. Verificar status dos containers.
2. Verificar logs do backend.
3. Verificar variáveis de ambiente.
4. Verificar conexão com Supabase.
5. Reiniciar backend se necessário.
6. Registrar incidente.

## Incidente: Worker parado

### Sintomas

- Auditorias não avançam.
- Fila Redis acumulada.
- Tasks em `running` por muito tempo.

### Ações

1. Verificar containers de worker.
2. Verificar Redis.
3. Verificar logs do Celery.
4. Reiniciar worker.
5. Marcar tarefas presas como `failed` ou reenfileirar.

## Incidente: PDF não gera

### Sintomas

- Relatório falha.
- PDF vazio.
- Erro de renderização.

### Ações

1. Verificar template HTML.
2. Verificar screenshots ausentes.
3. Verificar Playwright/WeasyPrint.
4. Verificar Storage.
5. Reprocessar somente Report Engine.

## Incidente: OAuth expirado

### Sintomas

- Google/Meta retorna erro de autorização.
- Integração aparece como expirada.

### Ações

1. Tentar refresh token.
2. Se falhar, marcar integração como `expired`.
3. Notificar usuário.
4. Solicitar reconexão.

## Incidente: custo de IA/API elevado

### Ações

1. Verificar auditorias executadas.
2. Verificar chamadas duplicadas.
3. Ativar limite por organização.
4. Pausar jobs não críticos.
5. Revisar prompts e cache.

## Checklist pós-incidente

- Registrar causa raiz.
- Registrar tempo de indisponibilidade.
- Criar ação preventiva.
- Atualizar runbook se necessário.