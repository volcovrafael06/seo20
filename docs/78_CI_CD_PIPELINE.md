# 78 — CI/CD Pipeline

## Objetivo

Definir o pipeline de integração e entrega contínua do SEO20 para garantir builds consistentes, testes automatizados, segurança básica e deploy controlado.

## Princípios

- Toda alteração deve passar por validação automática.
- Branch principal deve estar sempre em estado deployável.
- Deploy em produção deve ser rastreável.
- Segredos nunca devem aparecer em logs.
- Rollback deve ser simples.
- Migrations devem ser tratadas com cautela.

## Branches

### main

Branch estável. Representa produção ou próxima versão de produção.

### develop/staging

Opcional. Representa ambiente de homologação.

### feature/*

Branches de funcionalidade.

### hotfix/*

Correções urgentes.

## Gatilhos

Pipeline deve rodar em:

- Pull request.
- Push na main.
- Tag de release.
- Execução manual.

## Etapas de CI

### 1. Checkout

Baixar código.

### 2. Setup

Configurar:

- Node.
- Python.
- Cache de dependências.
- Docker quando necessário.

### 3. Lint

Rodar:

- ESLint.
- Prettier check.
- Ruff/Black para Python.

### 4. Typecheck

Rodar:

- TypeScript typecheck.
- Mypy ou validações Python quando aplicável.

### 5. Testes

Rodar:

- Testes unitários frontend.
- Testes unitários backend.
- Testes de integração críticos.

### 6. Build

Gerar build do frontend e validar pacote backend.

### 7. Segurança

Verificar:

- Dependências vulneráveis.
- Segredos no código.
- Arquivos sensíveis.

### 8. Artefatos

Publicar artefatos quando aplicável:

- Build frontend.
- Imagens Docker.
- Relatórios de teste.

## Etapas de CD

### Deploy em staging

Executado automaticamente após merge ou manualmente.

Inclui:

- Aplicar migrations em staging.
- Deploy backend.
- Deploy frontend.
- Deploy workers.
- Healthcheck.
- Testes smoke.

### Deploy em produção

Deve ser manual ou protegido inicialmente.

Inclui:

- Backup pré-release quando necessário.
- Aplicar migrations seguras.
- Deploy backend.
- Deploy workers.
- Deploy frontend.
- Healthcheck.
- Monitoramento pós-deploy.

## Migrations

Regras:

- Migrations devem ser reversíveis quando possível.
- Alterações destrutivas exigem plano específico.
- Adicionar coluna antes de depender dela.
- Remover coluna somente após desuso confirmado.
- Testar migration em staging.

## Docker

Imagens sugeridas:

- seo20-frontend.
- seo20-backend.
- seo20-worker.
- seo20-scheduler.

## Secrets

Segredos devem ficar em:

- GitHub Actions Secrets.
- Provedor de deploy.
- Vault futuro.

Nunca versionar:

- .env real.
- Service role key.
- Tokens OAuth.
- Credenciais de APIs.

## Healthchecks

Backend:

- /health.
- /ready.

Workers:

- Conexão Redis.
- Conexão banco.
- Última execução.

Frontend:

- Página inicial responde.
- Assets carregam.

## Smoke tests

Após deploy:

- Login.
- Dashboard carrega.
- API responde.
- Worker ativo.
- Storage acessível.
- Relatório simples gera.

## Rollback

Deve existir plano para:

- Reverter imagem.
- Reverter variável.
- Pausar worker.
- Reprocessar jobs.
- Corrigir migration problemática.

## Proteções

- Branch protection na main.
- Review obrigatório.
- Status checks obrigatórios.
- Deploy production protegido.
- Logs de deploy.

## Evolução futura

- Preview deployments por PR.
- Testes E2E completos.
- Canary deploy.
- Blue/green deploy.
- SAST/DAST.
- SBOM.
- Assinatura de imagens.
- Release notes automáticas.