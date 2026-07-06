# 119 — Page Analysis Pipeline

## Objetivo

Definir como cada página coletada pelo crawler será analisada e transformada em dados úteis para auditoria.

## Etapas

1. Normalizar URL.
2. Capturar resposta.
3. Extrair HTML.
4. Identificar metadados.
5. Avaliar indexabilidade.
6. Extrair headings.
7. Extrair links.
8. Extrair imagens.
9. Calcular sinais técnicos.
10. Persistir resultado.

## Dados extraídos

- URL final.
- Status HTTP.
- Title.
- Meta description.
- Canonical.
- Robots.
- H1 e H2.
- Links internos.
- Links externos.
- Imagens.
- Tamanho da página.

## Normalização

Regras:

- Remover fragmentos.
- Padronizar protocolo.
- Padronizar barras finais quando necessário.
- Evitar duplicidade de URLs equivalentes.

## Saída

Cada página deve gerar um registro estruturado com dados técnicos e flags de problemas.

## Evolução futura

- Análise de conteúdo semântico.
- Análise visual.
- Detecção de layout.
- Classificação por tipo de página.
- Similaridade entre páginas.