# 92 — Design System

## Objetivo

Definir o sistema visual do SEO20 para garantir consistência entre dashboard, relatórios, portal do cliente e telas administrativas.

## Princípios

- Clareza acima de decoração.
- Dados precisam ser legíveis rapidamente.
- Cores devem comunicar estado e prioridade.
- Componentes devem ser reutilizáveis.
- Interface deve funcionar bem em desktop e mobile.

## Tokens principais

### Cores

- Primary: identidade principal da plataforma.
- Success: sucesso e melhoria.
- Warning: atenção.
- Danger: erro, risco crítico.
- Info: informação neutra.
- Muted: dados secundários.

### Tipografia

- Fonte principal para interface.
- Fonte monoespaçada para dados técnicos, URLs e códigos.
- Hierarquia clara de títulos.

### Espaçamento

Usar escala consistente para:

- Cards.
- Tabelas.
- Modais.
- Formulários.
- Relatórios.

## Componentes

- Button.
- Card.
- Badge.
- Table.
- Tabs.
- Modal.
- Drawer.
- Tooltip.
- Alert.
- Progress.
- ScoreCard.
- RecommendationCard.
- MetricChart.
- EmptyState.

## Scores

Scores devem ter:

- Valor numérico.
- Categoria textual.
- Cor de estado.
- Explicação.
- Tendência quando disponível.

## Estados

Componentes devem suportar:

- Default.
- Hover.
- Focus.
- Disabled.
- Loading.
- Error.
- Success.

## Acessibilidade

- Contraste adequado.
- Navegação por teclado.
- Labels em formulários.
- Estados focáveis.
- Textos alternativos quando aplicável.

## White-label

O design system deve aceitar variações por agência:

- Logo.
- Cores.
- Rodapé.
- Relatórios.
- Portal do cliente.

## Regras

- Não usar cor como único indicador.
- Não criar componente novo sem verificar existência.
- Não quebrar layout com URLs longas.
- Não esconder erro técnico sem mensagem útil.

## Evolução futura

- Storybook.
- Tokens exportáveis.
- Temas por agência.
- Biblioteca de gráficos.
- Templates visuais por segmento.