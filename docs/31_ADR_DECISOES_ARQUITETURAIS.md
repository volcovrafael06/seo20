# 31 — ADRs: Architecture Decision Records

## Objetivo

Registrar decisões arquiteturais importantes do SEO20, o contexto de cada decisão, alternativas consideradas e consequências.

## ADR-001 — Usar Supabase como base inicial

### Status

Aceito.

### Contexto

O projeto precisa de autenticação, banco PostgreSQL, storage, RLS e possibilidade de uso de pgvector.

### Decisão

Usar Supabase Cloud como base inicial.

### Consequências

Benefícios:

- Reduz tempo de MVP.
- Facilita autenticação.
- Possui RLS.
- Suporta Storage.
- Suporta pgvector.

Riscos:

- Dependência de provedor.
- Custos podem subir com escala.
- Algumas operações avançadas exigirão cuidado.

## ADR-002 — Usar FastAPI no backend

### Status

Aceito.

### Contexto

A plataforma precisa integrar crawlers, IA, workers, APIs externas e tarefas assíncronas.

### Decisão

Usar Python com FastAPI.

### Consequências

Benefícios:

- Ecossistema forte para IA e automação.
- Boa performance.
- Fácil documentação OpenAPI.
- Integra bem com Celery e Playwright.

Riscos:

- Exige organização para evitar backend monolítico desordenado.

## ADR-003 — Usar Next.js no frontend

### Status

Aceito.

### Contexto

A plataforma precisa de dashboard moderno, responsivo e com experiência SaaS.

### Decisão

Usar Next.js, React, TypeScript e Tailwind.

### Consequências

Benefícios:

- Excelente DX.
- Bom ecossistema.
- Facilita telas complexas.
- Pode evoluir para SSR/SEO em áreas públicas.

Riscos:

- Precisa controle de estado e organização de componentes.

## ADR-004 — Processamento assíncrono com Redis e Celery

### Status

Aceito.

### Contexto

Auditorias podem demorar minutos e envolver muitas chamadas externas.

### Decisão

Usar Redis como broker e Celery para workers.

### Consequências

Benefícios:

- API permanece rápida.
- Workers podem escalar.
- Permite retentativas e filas por tipo.

Riscos:

- Mais componentes operacionais.
- Exige observabilidade.

## ADR-005 — IA interpretativa, não coletora principal

### Status

Aceito.

### Contexto

A IA pode errar se for usada como fonte primária de dados.

### Decisão

A IA só interpreta dados coletados por motores, APIs e crawlers.

### Consequências

Benefícios:

- Menos alucinação.
- Relatórios mais confiáveis.
- Melhor rastreabilidade.

Riscos:

- Mais trabalho de engenharia nos motores.

## ADR-006 — Relatórios em HTML para PDF

### Status

Aceito.

### Contexto

O relatório precisa ser visualmente profissional e fácil de evoluir.

### Decisão

Gerar HTML/CSS e exportar para PDF via Playwright ou WeasyPrint.

### Consequências

Benefícios:

- Controle visual.
- Reuso de componentes.
- Facilidade para preview web.

Riscos:

- PDF exige testes de layout.