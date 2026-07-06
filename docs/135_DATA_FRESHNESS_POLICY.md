# 135 — Data Freshness Policy

## Objetivo

Definir como o SEO20 indica idade, origem e atualização dos dados usados em auditorias, relatórios e dashboards.

## Princípios

- Toda métrica deve ter data de coleta.
- Dados externos devem informar fonte.
- Dados antigos devem ser sinalizados.
- Usuário deve conseguir solicitar atualização quando permitido.

## Categorias

### Dados em tempo de auditoria

Coletados durante execução da auditoria.

### Dados sincronizados

Obtidos por integrações em ciclos recorrentes.

### Dados estimados

Vindos de ferramentas externas ou cálculos aproximados.

## Campos recomendados

- source.
- collected_at.
- updated_at.
- freshness_status.
- is_estimated.

## Status

- fresh.
- acceptable.
- stale.
- unavailable.

## Regras

- Relatórios devem exibir data de geração.
- Dashboards devem exibir última atualização.
- Recomendação baseada em dado antigo deve indicar baixa confiança.

## Evolução futura

- Atualização automática por prioridade.
- Alertas de dado desatualizado.
- Políticas diferentes por plano.