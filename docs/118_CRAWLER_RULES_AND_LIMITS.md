# 118 — Crawler Rules and Limits

## Objetivo

Definir regras de execução do crawler do SEO20 para garantir segurança, previsibilidade e controle de custo.

## Entrada

- Site inicial.
- Limite de páginas.
- Profundidade máxima.
- Escopo de domínio.
- Configurações da organização.

## Limites iniciais

- Definir número máximo de páginas por plano.
- Definir tempo máximo por auditoria.
- Definir concorrência máxima por domínio.
- Definir tamanho máximo de resposta por página.
- Definir número máximo de redirecionamentos.

## Regras de escopo

O crawler deve permanecer dentro do domínio configurado, exceto quando houver regra explícita para subdomínios.

## Estados

- pending.
- running.
- completed.
- failed.
- cancelled.

## Falhas tratáveis

- Timeout.
- Erro de DNS.
- Erro HTTP.
- Redirecionamento excessivo.
- Página muito grande.
- Conteúdo não suportado.

## Saída

- Páginas visitadas.
- Páginas ignoradas.
- Erros encontrados.
- Tempo total.
- Estatísticas do crawl.

## Evolução futura

- Renderização JavaScript.
- Crawl mobile e desktop.
- Priorização por sitemap.
- Detecção de páginas órfãs.
- Controle avançado por plano.