# 26 — RAG e Base de Conhecimento

## Objetivo

Definir como o SEO20 utilizará uma base de conhecimento para apoiar os agentes de IA com informações consistentes, versionadas e reutilizáveis.

## Por que usar RAG

A plataforma precisa gerar recomendações consistentes para SEO, tráfego pago, CRO, conteúdo, backlinks e estratégia. O RAG permite que os agentes consultem uma base controlada antes de escrever diagnósticos ou sugerir ações.

## Stack

- Supabase PostgreSQL.
- Extensão pgvector.
- Tabela de documentos.
- Tabela de chunks.
- Embeddings.
- Metadados por fonte, versão e categoria.

## Tipos de conhecimento

- Boas práticas de SEO técnico.
- Boas práticas de SEO local.
- Diretrizes de backlinks seguros.
- Playbooks de Google Ads.
- Playbooks de Meta Ads.
- Modelos de relatório.
- Argumentos comerciais da agência.
- Checklists por segmento.
- Histórico de recomendações aplicadas.
- Casos internos.

## Estrutura sugerida

### knowledge_documents

Campos:

- id.
- organization_id.
- title.
- category.
- source_type.
- version.
- status.
- created_at.

### knowledge_chunks

Campos:

- id.
- document_id.
- content.
- embedding vector.
- metadata jsonb.
- created_at.

## Categorias

- seo_technical.
- seo_local.
- backlinks.
- google_ads.
- meta_ads.
- cro.
- content.
- reporting.
- sales.
- automation.

## Versionamento

Toda fonte importante deve ter versão. Quando uma prática mudar, criar nova versão em vez de sobrescrever sem histórico.

## Uso pelos agentes

Fluxo:

1. Agente recebe tarefa.
2. Sistema identifica categoria.
3. Busca chunks relevantes.
4. Injeta trechos no prompt.
5. Agente responde usando dados da auditoria + conhecimento recuperado.

## Regras

- RAG não substitui dados coletados.
- Dados do cliente têm prioridade sobre conhecimento genérico.
- Se não houver evidência, o agente deve indicar incerteza.
- Não usar fontes desatualizadas para decisões críticas.

## Atualização da base

Processo recomendado:

1. Adicionar documento.
2. Revisar conteúdo.
3. Gerar chunks.
4. Gerar embeddings.
5. Marcar como ativo.
6. Registrar versão.

## Controle de qualidade

- Evitar documentos duplicados.
- Revisar fontes periodicamente.
- Marcar conhecimento experimental.
- Separar opinião interna de prática validada.

## Futuro

- Base por segmento.
- Base white-label por agência.
- Aprendizado com resultados reais.
- Sugestão automática de novos playbooks.