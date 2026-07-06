# 41 — Onboarding para Desenvolvedores

## Objetivo

Este documento orienta novos desenvolvedores a entenderem o SEO20, configurarem o ambiente local e contribuírem com segurança.

## Leitura obrigatória

Antes de codar, ler:

1. `00_MASTER_INDEX.md`
2. `02_ARQUITETURA.md`
3. `30_ARQUITETURA_C4.md`
4. `31_ADR_DECISOES_ARQUITETURAIS.md`
5. `32_ERD_MODELO_ENTIDADE_RELACIONAMENTO.md`
6. `28_SECURITY_OBSERVABILITY.md`

## Stack

- Frontend: Next.js, React, TypeScript, Tailwind.
- Backend: FastAPI, Python, Pydantic.
- Banco: Supabase PostgreSQL.
- Vetores: pgvector.
- Filas: Redis e Celery.
- Crawlers: Playwright.
- Relatórios: HTML/CSS para PDF.

## Primeiro dia

1. Clonar o repositório.
2. Criar arquivo `.env` local.
3. Instalar dependências do backend.
4. Instalar dependências do frontend.
5. Configurar Supabase.
6. Rodar migrations.
7. Subir Redis.
8. Executar API.
9. Executar frontend.
10. Criar primeira organização e usuário.

## Padrões de trabalho

- Usar branches por feature.
- Usar Conventional Commits.
- Criar PR para revisão.
- Escrever testes para lógica crítica.
- Atualizar documentação ao alterar arquitetura.

## Convenções de commit

- `feat:` nova funcionalidade.
- `fix:` correção.
- `docs:` documentação.
- `refactor:` refatoração.
- `test:` testes.
- `chore:` manutenção.

## Critérios para PR

Todo PR deve informar:

- O que mudou.
- Por que mudou.
- Como testar.
- Impacto em banco/API.
- Prints quando alterar UI.

## Boas práticas

- Não expor segredos.
- Não colocar service role no frontend.
- Não criar dependência direta entre UI e Supabase para regras críticas.
- Não executar automações sem aprovação humana.
- Não usar IA como fonte primária de dados.

## Ambiente local recomendado

- Node LTS.
- Python 3.12+.
- Docker.
- Git.
- VS Code.
- Extensões: Python, ESLint, Prettier, Tailwind, Docker.