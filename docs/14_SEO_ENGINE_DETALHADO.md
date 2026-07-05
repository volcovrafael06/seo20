# 14 — SEO Engine Detalhado

## Objetivo

O SEO Engine é responsável por auditar tecnicamente o site do cliente, identificar problemas que prejudicam indexação, ranqueamento, entendimento semântico, experiência do usuário e conversão orgânica.

## Entradas

- Domínio do cliente.
- URLs descobertas pelo crawler.
- Sitemap.
- Robots.txt.
- HTML renderizado.
- Dados de performance.
- Search Console quando conectado.

## Áreas analisadas

### 1. Indexabilidade

Verificar:

- Status HTTP.
- Bloqueios no robots.txt.
- Meta robots noindex/nofollow.
- Canonical.
- Sitemap XML.
- Redirecionamentos.
- Páginas com erro 4xx/5xx.
- Páginas órfãs.

Recomendação: todo problema de indexabilidade deve ter prioridade alta, pois pode impedir o Google de acessar ou recomendar a página.

### 2. Meta tags

Analisar:

- Title único por página.
- Comprimento do title.
- Palavra-chave no title.
- Meta description única.
- Clareza comercial da description.
- Open Graph.
- Twitter Cards.

### 3. Headings

Analisar:

- Existência de H1.
- Apenas um H1 principal por página.
- H2 e H3 bem estruturados.
- Palavra-chave ou variação semântica nos headings.
- Ordem hierárquica.

### 4. Conteúdo

Avaliar:

- Profundidade.
- Clareza da oferta.
- Presença da cidade quando for SEO local.
- Uso de sinônimos.
- FAQ.
- Provas de confiança.
- Conteúdo duplicado.
- Páginas finas.

### 5. Dados estruturados

Verificar Schema.org:

- Organization.
- LocalBusiness.
- Product.
- Service.
- FAQPage.
- BreadcrumbList.
- Article.
- Review quando aplicável.

### 6. Performance

Fontes:

- PageSpeed Insights.
- Lighthouse.
- CrUX quando disponível.

Métricas:

- LCP.
- INP.
- CLS.
- FCP.
- TTFB.
- Peso total da página.
- Imagens pesadas.
- JavaScript excessivo.

### 7. Mobile

Verificar:

- Responsividade.
- Tamanho de fonte.
- Clique em botões.
- Elementos sobrepostos.
- Velocidade em rede móvel.
- CTA acima da dobra.

### 8. Links internos

Analisar:

- Profundidade de clique.
- Links quebrados.
- Âncoras genéricas.
- Páginas importantes pouco linkadas.
- Menus e rodapé.

### 9. Imagens

Verificar:

- ALT ausente.
- Nome de arquivo genérico.
- Tamanho excessivo.
- Formato moderno.
- Lazy loading.

### 10. EEAT

Avaliar sinais de experiência, autoridade e confiança:

- Página Sobre.
- Autor ou responsável técnico.
- Endereço.
- CNPJ quando aplicável.
- Depoimentos.
- Cases.
- Certificações.
- Políticas.
- Contato claro.

## Score SEO Técnico

Proposta de pesos:

- Indexabilidade: 25%.
- Meta/headings: 15%.
- Conteúdo: 15%.
- Performance: 15%.
- Mobile: 10%.
- Schema: 10%.
- Links/imagens: 10%.

## Saída

Cada problema deve gerar:

- Página afetada.
- Tipo de erro.
- Evidência.
- Impacto.
- Esforço.
- Prioridade.
- Recomendação prática.

## Linguagem no relatório

A IA deve traduzir problemas técnicos em impacto comercial. Exemplo:

- Técnico: "H1 ausente".
- Comercial: "O Google tem mais dificuldade para entender o serviço principal desta página, reduzindo potencial de ranqueamento."