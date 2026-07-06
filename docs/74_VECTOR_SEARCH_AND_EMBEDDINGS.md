# 74 — Vector Search and Embeddings

## Objetivo

Definir a estratégia de embeddings e busca vetorial do SEO20 usando PostgreSQL + pgvector para memória semântica, RAG, comparação de conteúdos, agrupamento de tópicos e análise de similaridade.

## Casos de uso

- RAG para agentes de IA.
- Busca semântica em documentação.
- Busca semântica em auditorias anteriores.
- Comparação de páginas.
- Detecção de canibalização.
- Agrupamento de keywords.
- Agrupamento de tópicos.
- Similaridade entre recomendações.
- Memória por cliente.

## Modelos de embedding

A escolha do modelo deve considerar:

- Qualidade.
- Custo.
- Latência.
- Idioma português.
- Tamanho do vetor.
- Disponibilidade.
- Privacidade.

## Estratégia inicial

MVP:

- Usar um único modelo de embedding principal.
- Registrar o modelo usado em cada vetor.
- Permitir reprocessamento futuro.
- Manter metadados suficientes para migração.

## Estrutura de armazenamento

Tabelas sugeridas:

- embedding_collections.
- embedding_items.
- embedding_vectors.

## Campos de embedding_items

- id.
- organization_id.
- client_id.
- source_type.
- source_id.
- title.
- content.
- metadata.
- created_at.
- updated_at.

## Campos de embedding_vectors

- id.
- item_id.
- organization_id.
- embedding_model.
- vector.
- dimensions.
- content_hash.
- created_at.

## Content hash

Cada conteúdo deve ter hash. Se o conteúdo não mudou, não há necessidade de gerar novo embedding.

## Busca vetorial

A consulta deve aplicar:

1. Filtro de tenant.
2. Filtro opcional de cliente.
3. Filtro opcional de tipo de fonte.
4. Similaridade vetorial.
5. Reranking quando necessário.

## Métricas de similaridade

Possíveis:

- Cosine distance.
- Inner product.
- L2 distance.

A escolha deve ser compatível com o modelo de embeddings.

## Busca híbrida

Busca vetorial deve ser combinada com busca lexical para melhorar resultados em:

- Nomes de empresas.
- URLs.
- Termos técnicos.
- Erros específicos.
- IDs e códigos.

## Chunking

Diretrizes:

- Evitar chunks longos demais.
- Evitar chunks sem contexto.
- Preservar headings.
- Incluir metadados ricos.
- Usar overlap quando necessário.

## Índices

Avaliar:

- IVFFlat.
- HNSW.

No MVP, a escolha deve priorizar simplicidade e performance suficiente.

## Reindexação

Reprocessar embeddings quando:

- Modelo mudar.
- Chunking mudar.
- Conteúdo mudar.
- Metadados críticos forem corrigidos.

## Observabilidade

Registrar:

- Tempo de embedding.
- Custo por documento.
- Tamanho do conteúdo.
- Falhas.
- Latência de busca.
- Taxa de recuperação útil.

## Segurança

- Vetores também são dados sensíveis.
- Aplicar isolamento por organization_id.
- Não compartilhar embeddings entre tenants.
- Não gerar embedding de segredos.
- Não indexar tokens de API.

## Limitações

Embeddings não substituem banco relacional. Eles ajudam a encontrar contexto semelhante, mas decisões transacionais devem usar dados estruturados.

## Evolução futura

- Embeddings multi-modelo.
- Reranking neural.
- Busca multimodal.
- Embeddings por entidade.
- Vetores por página e por seção.
- Clusterização automática.
- Detecção de temas emergentes.