# 20 — Design System

## Objetivo

Definir a identidade visual e os padrões de interface do SEO20. O sistema deve transmitir tecnologia, clareza, precisão e confiança comercial.

## Direção visual

- Aparência SaaS premium.
- Fundo claro por padrão.
- Cards limpos.
- Gráficos bem legíveis.
- Pouca poluição visual.
- Hierarquia forte de informação.

## Paleta sugerida

### Cores principais

- Primary: azul profundo para ações principais.
- Secondary: roxo para IA e automação.
- Success: verde para bom desempenho.
- Warning: amarelo/laranja para atenção.
- Danger: vermelho para problemas críticos.
- Neutral: cinzas para textos, bordas e fundos.

## Tipografia

Sugestão:

- Inter para interface.
- JetBrains Mono para logs, IDs e dados técnicos.

## Componentes base

- Button.
- Input.
- Select.
- Textarea.
- Card.
- Badge.
- Alert.
- Table.
- Tabs.
- Modal.
- Drawer.
- Tooltip.
- Progress.
- Skeleton.
- Breadcrumb.
- Dropdown.

## Componentes específicos

### ScoreCard

Mostra uma nota de 0 a 100 com cor contextual.

Campos:

- title.
- score.
- description.
- trend.

### AuditProgress

Mostra módulos da auditoria e progresso.

### RecommendationCard

Mostra recomendação com:

- módulo.
- prioridade.
- impacto.
- esforço.
- descrição.
- ação.

### CompetitorTable

Compara cliente com concorrentes.

### KeywordTable

Lista palavras com intenção, volume, CPC e prioridade.

### ReportPreview

Mostra preview do PDF e botão de download.

## Gráficos

Tipos:

- Radar.
- Barra.
- Linha.
- Donut.
- Tabela comparativa.

Regras:

- Não exagerar em cores.
- Sempre incluir legenda.
- Mostrar insight principal acima do gráfico.
- Evitar gráficos que não gerem decisão.

## Estados

### Loading

Usar skeletons e mensagens de progresso.

### Empty

Sempre sugerir ação.

### Error

Mensagem amigável + detalhes técnicos recolhidos.

### Disabled

Explicar por que está desabilitado.

## Acessibilidade

- Contraste adequado.
- Foco visível.
- Navegação por teclado.
- Labels em formulários.
- Textos alternativos em ícones informativos.

## Tom de voz

- Direto.
- Consultivo.
- Comercial sem exagero.
- Evitar jargão técnico sem explicação.

Exemplo:

Ruim: "Meta description ausente".

Bom: "Esta página não tem descrição para o Google. Isso pode reduzir o clique do cliente quando ela aparece na busca."