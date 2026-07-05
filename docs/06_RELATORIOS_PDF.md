# 06 — Relatórios PDF

## Objetivo

O relatório PDF é o principal ativo comercial da plataforma. Ele deve transformar dados técnicos em uma apresentação executiva bonita, clara e convincente.

## Formato

- PDF profissional.
- Exportado a partir de HTML/CSS.
- Gerado por Playwright PDF ou WeasyPrint.
- Salvo no Supabase Storage.
- Com link interno e, opcionalmente, link público assinado.

## Estrutura do relatório

### 1. Capa

- Logo da agência.
- Nome do cliente.
- Site analisado.
- Cidade e segmento.
- Data da auditoria.
- Score geral.

### 2. Sumário executivo

Resumo curto para decisores:

- Situação atual.
- Principais problemas.
- Maiores oportunidades.
- Impacto estimado.
- Próximos passos.

### 3. Score geral

Visual com nota de 0 a 100.

Subscores:

- SEO técnico.
- SEO local.
- Conteúdo.
- Backlinks.
- Google Ads.
- Meta Ads.
- Conversão.
- Branding.
- GEO.

### 4. Gráficos

Tipos recomendados:

- Radar chart para visão 360.
- Barras para comparação com concorrentes.
- Linha para evolução histórica.
- Donut para distribuição de problemas por prioridade.
- Tabelas para keywords e backlinks.

### 5. Benchmark com concorrentes

Comparar cliente contra 3 a 10 concorrentes.

Indicadores:

- Posição média orgânica.
- Presença no Google Maps.
- Quantidade de avaliações.
- Nota média.
- Backlinks.
- Autoridade.
- Velocidade.
- Conteúdo.
- Ads.

### 6. SEO técnico

Mostrar problemas e evidências:

- Títulos ruins.
- Meta descriptions ausentes.
- Headings fracos.
- Sitemap/robots.
- Performance.
- Mobile.
- Schema.
- Links quebrados.

### 7. SEO local

Mostrar:

- Google Business Profile.
- Categorias.
- Serviços.
- Avaliações.
- Fotos.
- Concorrentes locais.
- Oportunidades.

### 8. Backlinks

Mostrar:

- Backlinks totais.
- Domínios de referência.
- Autoridade.
- Link gap.
- Links tóxicos.
- Oportunidades seguras.

### 9. Ads

Quando houver acesso:

- Google Ads.
- Meta Ads.
- Desperdício de verba.
- Conversões.
- Criativos.
- Públicos.
- Melhorias sugeridas.

### 10. SWOT

- Forças.
- Fraquezas.
- Oportunidades.
- Ameaças.

### 11. Plano de ação 30/60/90

30 dias:

- Correções críticas.
- SEO técnico básico.
- Google Business.
- Tracking.

60 dias:

- Conteúdo.
- Backlinks.
- Landing pages.
- Otimização de campanhas.

90 dias:

- Escala.
- Automação.
- CRO.
- Estratégia avançada.

### 12. Checklist executivo

Itens com status:

- Corrigir agora.
- Planejar.
- Monitorar.
- Automatizar.

### 13. Proposta de serviços

Opcional. O relatório pode sugerir pacotes da agência:

- Gestão de tráfego pago.
- SEO local.
- SEO técnico.
- Criação de site.
- Landing pages.
- Conteúdo.
- Backlinks.
- CRO.

## Layout visual

Direção visual:

- Aparência premium.
- Cores sólidas.
- Bastante espaço em branco.
- Gráficos limpos.
- Tabelas legíveis.
- Destaques por prioridade.
- Linguagem executiva.

## Regras de escrita

- Evitar jargão técnico sem explicação.
- Sempre explicar impacto comercial.
- Trocar "erro técnico" por "perda de oportunidade".
- Exibir evidência sempre que possível.
- Priorizar clareza para dono de empresa.

## Exportação

Fluxo:

1. Montar dados finais.
2. Renderizar template HTML.
3. Gerar gráficos como SVG ou canvas exportado.
4. Inserir screenshots.
5. Exportar PDF.
6. Salvar no Storage.
7. Registrar em `reports`.
8. Liberar download no dashboard.