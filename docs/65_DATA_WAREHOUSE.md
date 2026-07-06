# 65 — Data Warehouse

## Objetivo

Definir a camada analítica do SEO20 para armazenar histórico, consolidar métricas, gerar dashboards e permitir análises avançadas por cliente, agência e período.

## Por que existe

O banco operacional é otimizado para o funcionamento do sistema. O Data Warehouse é otimizado para análise histórica, BI, relatórios, tendências e benchmarks.

## Fontes de dados

- Auditorias SEO.
- Google Search Console.
- GA4.
- Google Ads.
- Meta Ads.
- Google Business Profile.
- Crawlers.
- SERP Engine.
- Backlink Engine.
- CRO Engine.
- Eventos do sistema.

## Modelos analíticos

### Fatos

- fact_audit_scores.
- fact_keyword_rankings.
- fact_search_console_daily.
- fact_ga4_daily.
- fact_ads_daily.
- fact_gbp_daily.
- fact_recommendation_status.
- fact_report_generation.

### Dimensões

- dim_organization.
- dim_client.
- dim_website.
- dim_page.
- dim_keyword.
- dim_channel.
- dim_campaign.
- dim_date.
- dim_location.

## Métricas principais

- Score geral.
- Score SEO técnico.
- Score local.
- Score GEO.
- Score CRO.
- Cliques orgânicos.
- Impressões.
- CTR.
- Posição média.
- Conversões.
- Custo.
- CPC.
- CPA.
- ROAS.
- Leads.
- Recomendações abertas.
- Recomendações concluídas.

## Camadas

### Raw

Dados brutos coletados das integrações.

### Staging

Dados limpos, padronizados e deduplicados.

### Mart

Dados prontos para dashboard, relatórios e análises.

## Frequência

- Auditoria completa: sob demanda.
- Métricas de campanha: diária.
- Search Console: diária.
- GA4: diária.
- GBP: diária ou semanal.
- Rankings: conforme plano.

## Governança

- Cada linha deve conter organization_id.
- Não misturar tenants.
- Guardar origem dos dados.
- Registrar data de coleta.
- Usar particionamento quando necessário.
- Aplicar retenção por plano.

## Uso futuro

- Dashboards executivos.
- Benchmark entre clientes.
- Detecção de anomalias.
- Previsão de crescimento.
- Relatórios automáticos.
- Modelos de priorização.

## Regra crítica

O Data Warehouse não deve ser fonte de verdade transacional. Ele deve refletir dados consolidados para análise.