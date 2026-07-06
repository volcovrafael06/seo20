# 64 — Knowledge Graph

## Objetivo

O Knowledge Graph do SEO20 organiza entidades, relações e contexto de cada cliente para melhorar auditorias, recomendações e agentes de IA.

## Por que usar

SEO, GEO e estratégia dependem de contexto. Um grafo permite entender relações entre empresa, serviços, localidades, concorrentes, páginas, termos, entidades e canais.

## Entidades principais

- Organization.
- Client.
- Website.
- Page.
- Service.
- Product.
- Location.
- Keyword.
- Topic.
- Entity.
- Competitor.
- Campaign.
- Recommendation.
- Report.
- Integration.

## Relações principais

- Client owns Website.
- Website has Page.
- Page targets Keyword.
- Page covers Topic.
- Service available_in Location.
- Competitor ranks_for Keyword.
- Recommendation improves Page.
- Campaign sends_traffic_to Page.
- Topic related_to Entity.

## Uso no SEO20

- Melhorar contexto dos agentes.
- Identificar lacunas semânticas.
- Organizar clusters.
- Apoiar GEO.
- Criar recomendações mais precisas.
- Detectar páginas órfãs.
- Relacionar conteúdo com serviços reais.

## Implementação MVP

No MVP, o grafo pode ser modelado em PostgreSQL com tabelas relacionais e campos JSONB.

Tabelas sugeridas:

- graph_nodes.
- graph_edges.
- entity_mentions.
- topic_clusters.

## Evolução futura

- Graph database dedicado.
- Neo4j.
- Apache AGE no PostgreSQL.
- Vetores combinados com relações.
- Consulta híbrida RAG + grafo.

## Campos do nó

- id.
- organization_id.
- node_type.
- label.
- external_id.
- metadata.
- confidence.
- created_at.
- updated_at.

## Campos da relação

- id.
- organization_id.
- source_node_id.
- target_node_id.
- edge_type.
- weight.
- metadata.
- confidence.

## Regras

- O grafo deve ser multi-tenant.
- Não misturar dados entre organizações.
- Cada relação deve ter origem rastreável.
- Confidence baixo não deve gerar automação direta.
- Agentes devem citar evidências quando usarem o grafo.