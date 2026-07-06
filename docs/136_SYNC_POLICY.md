# 136 — Sync Policy

## Objetivo

Definir regras de atualização de dados externos no SEO20.

## Tipos

- Manual.
- Agendada.
- Por evento.

## Estados

- connected.
- syncing.
- synced.
- failed.
- expired.
- disabled.

## Regras

- Sincronizações devem rodar em fila.
- Falhas devem ser registradas.
- Limites externos devem ser respeitados.
- Dados devem manter fonte e data.

## Observabilidade

Registrar última execução, duração, status e quantidade de registros processados.

## Evolução

- Sync incremental.
- Reprocessamento por período.
- Alertas de falha recorrente.