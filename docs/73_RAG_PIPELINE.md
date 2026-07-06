# 73 — RAG Pipeline

## Objetivo

Definir o pipeline de RAG (Retrieval-Augmented Generation) do SEO20 para permitir que os agentes consultem documentação, dados do cliente, histórico, auditorias e base de conhecimento de forma controlada.

## Por que RAG

Agentes de IA precisam de contexto específico. RAG permite buscar informações relevantes antes da geração, reduzindo alucinação e evitando enviar contexto excessivo ao modelo.

## Fontes de conhecimento

- Documentação interna do SEO20.
- Dados do cliente.
- Auditorias anteriores.
- Relatórios anteriores.
- Recomendações concluídas.
- Base de serviços da agência.
- Informações comerciais.
- FAQs.
- Templates de proposta.
- Políticas internas.

## Etapas do pipeline

### 1. Ingestão

Receber documentos ou dados estruturados.

Tipos:

- Markdown.
- PDF.
- HTML.
- Texto.
- JSON.
- Dados de banco.
- Transcrições futuras.

### 2. Normalização

Converter conteúdo para formato textual limpo.

Ações:

- Remover boilerplate.
- Corrigir encoding.
- Preservar títulos.
- Preservar metadados.
- Separar seções.

### 3. Chunking

Dividir conteúdo em partes recuperáveis.

Estratégia:

- Chunk por heading quando possível.
- Tamanho moderado.
- Overlap controlado.
- Preservar referência ao documento original.

### 4. Enrichment

Adicionar metadados úteis:

- organization_id.
- client_id.
- document_type.
- source.
- created_at.
- updated_at.
- language.
- visibility.
- tags.

### 5. Embeddings

Gerar vetores para busca semântica.

### 6. Indexação

Salvar chunks, embeddings e metadados no pgvector.

### 7. Retrieval

Buscar os chunks mais relevantes para uma tarefa.

### 8. Reranking

Reordenar resultados por relevância, confiança e proximidade de contexto.

### 9. Context assembly

Montar o contexto final enviado ao agente.

### 10. Generation

Modelo gera resposta usando apenas contexto autorizado.

## Estrutura de tabela sugerida

- knowledge_documents.
- knowledge_chunks.
- knowledge_embeddings.
- retrieval_logs.

## Campos de document

- id.
- organization_id.
- client_id.
- title.
- source_type.
- source_url.
- visibility.
- metadata.
- created_at.
- updated_at.

## Campos de chunk

- id.
- document_id.
- organization_id.
- client_id.
- chunk_index.
- heading.
- content.
- token_count.
- metadata.

## Campos de embedding

- id.
- chunk_id.
- embedding_model.
- vector.
- created_at.

## Regras de segurança

- Retrieval deve filtrar por organization_id.
- Conteúdo privado não deve aparecer para outro tenant.
- Conteúdo de cliente deve respeitar permissões.
- Logs não devem salvar segredos sensíveis.
- Fontes devem ser rastreáveis.

## Estratégias de retrieval

### Semântico

Busca por similaridade vetorial.

### Lexical

Busca por palavras exatas, útil para nomes, URLs e termos técnicos.

### Híbrido

Combina busca semântica e lexical.

### Filtrado

Aplica filtros por cliente, tipo de documento e data.

## Controle de qualidade

Para cada retrieval, registrar:

- Query.
- Filtros.
- Chunks retornados.
- Score.
- Agente consumidor.
- Resultado final.

## Anti-padrões

- Enviar todos os documentos para o modelo.
- Ignorar permissões.
- Usar chunks muito grandes.
- Usar chunks sem metadados.
- Não registrar fonte.
- Usar RAG para substituir dados transacionais.

## Uso pelos agentes

- Report Agent usa auditorias e templates.
- Strategy Agent usa histórico e objetivos.
- Sales Agent usa pacotes e propostas anteriores.
- Content Agent usa serviços, páginas e FAQs.
- Automation Agent usa regras operacionais.

## Evolução futura

- Reranker dedicado.
- Knowledge Graph + RAG.
- Busca temporal.
- Memória por cliente.
- Avaliação automática de retrieval.
- Context compression.
- Multi-vector indexing.