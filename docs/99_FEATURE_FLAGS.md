# 99 — Feature Flags

## Objetivo

Definir o uso de feature flags para lançar recursos do SEO20 com controle, reduzir risco em produção e permitir ativação gradual por organização, plano ou ambiente.

## Princípios

- Recursos novos devem poder ser desligados rapidamente.
- Flags devem ser temporárias quando relacionadas a rollout.
- Toda flag deve ter dono e data de revisão.
- Flags não substituem controle de permissão.
- Mudanças críticas devem gerar audit log.

## Tipos de flag

### Release flags

Controlam lançamento gradual de funcionalidades.

### Ops flags

Permitem desabilitar recursos em incidentes.

### Experiment flags

Apoiam testes A/B ou validação de produto.

### Permission flags

Complementam plano e acesso, sem substituir RBAC.

## Escopos

- Global.
- Ambiente.
- Organização.
- Plano.
- Usuário.
- Cliente.

## Exemplos

- enable_geo_engine.
- enable_ai_reports.
- enable_wordpress_automation.
- enable_customer_portal.
- enable_white_label.
- disable_pdf_generation.
- pause_external_automations.

## Estrutura sugerida

Tabela `feature_flags`:

- id.
- key.
- description.
- enabled.
- scope_type.
- scope_id.
- owner.
- expires_at.
- created_at.
- updated_at.

## Regras

- Flags operacionais devem ser avaliadas no backend.
- Frontend pode usar flags para UI, mas backend deve validar acesso real.
- Flags expiradas devem ser revisadas.
- Flags de emergência devem ser rápidas de alterar.

## Observabilidade

Registrar:

- Alteração de flag.
- Usuário responsável.
- Escopo afetado.
- Antes/depois.
- Motivo.

## Anti-padrões

- Flags permanentes sem dono.
- Lógica de negócio duplicada por flag.
- Flag no frontend sem validação no backend.
- Usar flag para esconder bug sem issue.

## Evolução futura

- Painel visual.
- Rollout percentual.
- Segmentação por plano.
- Experimentos com métricas.
- Integração com incident response.