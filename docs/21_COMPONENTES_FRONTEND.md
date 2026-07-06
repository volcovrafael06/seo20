# 21 — Componentes Frontend

## Objetivo

Definir os componentes reutilizáveis que serão usados no frontend Next.js do SEO20.

## Componentes de layout

### AppShell

Estrutura principal com sidebar, topbar e área de conteúdo.

### Sidebar

Itens:

- Dashboard.
- Clientes.
- Auditorias.
- Oportunidades.
- Relatórios.
- Integrações.
- Configurações.

### Topbar

Itens:

- Nome da organização.
- Busca global.
- Notificações.
- Perfil do usuário.

## Componentes de dados

### DataTable

Tabela genérica com:

- Ordenação.
- Filtro.
- Paginação.
- Ações por linha.
- Empty state.

### MetricCard

Card simples para métricas.

### ScoreCard

Nota de 0 a 100 com status visual.

### StatusBadge

Status padrão:

- pending.
- running.
- completed.
- failed.
- waiting_credentials.

## Componentes de auditoria

### AuditTimeline

Mostra eventos da auditoria em ordem cronológica.

### AuditModuleProgress

Mostra progresso de cada módulo:

- Crawler.
- Keywords.
- SERP.
- SEO.
- Local SEO.
- Backlinks.
- Ads.
- IA.
- Relatório.

### RecommendationList

Lista recomendações priorizadas.

### RecommendationCard

Campos:

- Título.
- Módulo.
- Impacto.
- Esforço.
- Prioridade.
- Evidência.
- Ação recomendada.

## Componentes de gráficos

### RadarScoreChart

Mostra visão 360 dos scores.

### CompetitorBarChart

Compara cliente com concorrentes.

### TrendLineChart

Mostra evolução histórica.

### PriorityDonutChart

Mostra distribuição por prioridade.

## Componentes de relatório

### ReportPreview

Preview do relatório PDF.

### ReportDownloadButton

Gera ou baixa PDF.

### ShareReportModal

Cria link assinado para compartilhamento.

## Componentes de integração

### IntegrationCard

Mostra estado de conexão de uma ferramenta.

Estados:

- connected.
- disconnected.
- expired.
- error.

### ConnectIntegrationButton

Inicia OAuth ou fluxo de conexão.

## Formulários

### ClientForm

Campos:

- Nome.
- Site.
- Cidade.
- Estado.
- Segmento.
- Descrição.

### AuditCreateForm

Campos:

- Cliente.
- Tipo de auditoria.
- Módulos.

## Padrões técnicos

- Usar TypeScript em todos os componentes.
- Separar componentes puros de componentes conectados à API.
- Usar Zod para validação.
- Usar TanStack Query para dados remotos.
- Componentes devem ser pequenos e testáveis.

## Testes

Componentes críticos devem ter testes de renderização e estados:

- Loading.
- Empty.
- Error.
- Success.