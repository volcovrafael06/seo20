# 87 — Caching Strategy

## Objetivo

Definir a estratégia de cache do SEO20 para reduzir latência, custo de APIs externas, custo de IA e carga no banco.

## Princípios

- Cache deve ser seguro em ambiente multi-tenant.
- Toda chave de cache sensível deve incluir organization_id.
- Cache não pode esconder dados críticos desatualizados sem indicação.
- Dados caros e pouco mutáveis devem ser cacheados.
- Dados transacionais sensíveis exigem cautela.
- Invalidação deve ser explícita quando possível.

## Camadas de cache

### Browser/Frontend

Usado para:

- Assets estáticos.
- Dados de UI de curta duração.
- Estado de navegação.

### CDN

Usado para:

- Assets públicos.
- Imagens de marca.
- Relatórios compartilhados quando permitido.

### API cache

Usado para:

- Dashboards.
- Listagens.
- Scores consolidados.
- Configurações pouco mutáveis.

### Redis cache

Usado para:

- Resultado de integrações.
- Estado de progresso.
- Rate limit.
- Locks.
- Cache de IA.
- Cache de SERP/API externas.

### Banco/cache materializado

Usado para:

- Métricas agregadas.
- Views materializadas.
- Data marts.
- Dashboards históricos.

## O que cachear

- Resultados de DataForSEO.
- SERPs por keyword/localidade.
- Métricas de GSC agregadas.
- Métricas de GA4 agregadas.
- Dados de GBP.
- Scores por auditoria.
- Relatórios gerados.
- Saídas de agentes de IA com input idêntico.
- Configurações de white-label.
- Permissões por sessão, com TTL curto.

## O que não cachear sem cuidado

- Tokens de acesso.
- Segredos.
- Dados de billing em alteração.
- Permissões administrativas críticas com TTL longo.
- Estado de automação em execução.
- Dados que exigem consistência imediata.

## Estrutura de chave

Formato sugerido:

```text
seo20:{env}:{organization_id}:{resource}:{identifier}:{version}
```

Exemplos:

```text
seo20:prod:org_123:gsc:site_456:daily:v1
seo20:prod:org_123:ai:audit_summary:hash:v3
seo20:prod:org_123:dashboard:client_789:v1
```

## TTLs sugeridos

- Dashboard: 1 a 5 minutos.
- Configurações: 5 a 30 minutos.
- Search Console diário: 12 a 24 horas.
- GA4 diário: 6 a 24 horas.
- SERP: 24 horas a 7 dias conforme plano.
- IA por input idêntico: 7 a 30 dias.
- GBP: 6 a 24 horas.
- Relatórios PDF: persistente até expiração ou regeneração.

## Invalidação

Eventos que invalidam cache:

- Cliente atualizado.
- Site atualizado.
- Integração conectada/revogada.
- Auditoria concluída.
- Recomendação atualizada.
- Relatório regenerado.
- White-label alterado.
- Papel de usuário alterado.

## Cache de IA

Usar hash composto:

- prompt_version.
- model.
- task_type.
- input_hash.
- organization_id.

Regras:

- Não cachear quando input contém dados temporários sensíveis.
- Guardar metadados de custo.
- Invalidar quando prompt version muda.
- Marcar resultado como cache_hit.

## Cache de integrações externas

Objetivo:

- Reduzir custo.
- Evitar rate limit.
- Melhorar tempo de auditoria.

Regras:

- Registrar data de coleta.
- Exibir freshness quando relevante.
- Permitir force refresh para usuários autorizados.

## Locks

Redis também deve ser usado para locks:

- Evitar auditoria duplicada.
- Evitar duas sincronizações iguais.
- Evitar geração duplicada de relatório.
- Evitar corrida em webhooks.

## Segurança multi-tenant

Obrigatório:

- organization_id na chave.
- Nunca compartilhar cache entre tenants.
- Não cachear payload com service role.
- Não cachear segredo em texto claro.
- Limpar cache ao remover organização.

## Observabilidade

Métricas:

- Cache hit rate.
- Cache miss rate.
- Latência com e sem cache.
- Tamanho ocupado.
- Chaves expiradas.
- Evictions.
- Economia estimada de custo.

## Anti-padrões

- Cache sem TTL.
- Chave sem organization_id.
- Cache de permissão por tempo longo.
- Cache que impede ver erro real.
- Cache de dados externos sem freshness.
- Cachear tudo sem estratégia.

## Evolução futura

- Cache tags.
- Invalidação por evento.
- CDN avançada.
- Cache warming.
- Cache analytics.
- Camada de materialized views para dashboards.
- Política de cache por plano.