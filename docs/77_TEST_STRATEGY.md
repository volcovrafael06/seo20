# 77 — Test Strategy

## Objetivo

Definir a estratégia de testes do SEO20 para garantir estabilidade, segurança e evolução contínua do produto.

## Escopo

A estratégia cobre:

- Backend FastAPI.
- Frontend Next.js.
- Banco Supabase/PostgreSQL.
- Workers Celery.
- Redis.
- Crawlers Playwright.
- Relatórios PDF.
- Agentes de IA.
- Integrações externas.
- Automações.

## Pirâmide de testes

### Testes unitários

Devem cobrir lógica isolada:

- Cálculo de scores.
- Normalização de URLs.
- Validação de payloads.
- Regras de priorização.
- Parsing de dados.
- Transformações.

### Testes de integração

Devem cobrir interação entre componentes:

- API + banco.
- Worker + Redis.
- API + Supabase Auth.
- Crawlers + armazenamento.
- Report Engine + Storage.
- Integrações OAuth.

### Testes end-to-end

Devem cobrir fluxos completos:

- Cadastro/login.
- Criar cliente.
- Criar site.
- Executar auditoria.
- Visualizar resultado.
- Gerar relatório.
- Compartilhar relatório.

## Testes de backend

Ferramentas sugeridas:

- pytest.
- pytest-asyncio.
- httpx.
- factory_boy ou factories próprias.

Áreas obrigatórias:

- Auth.
- RBAC.
- RLS.
- CRUD de clientes.
- Auditorias.
- Recomendações.
- Relatórios.
- Integrações.

## Testes de frontend

Ferramentas sugeridas:

- Vitest.
- React Testing Library.
- Playwright.

Áreas obrigatórias:

- Autenticação.
- Dashboard.
- Formulários.
- Estados de loading/erro.
- Tabelas.
- Visualização de relatórios.
- Permissões por papel.

## Testes de banco

Validar:

- Migrations.
- Constraints.
- Índices.
- Políticas RLS.
- Triggers.
- Views.
- Integridade referencial.

## Testes de multi-tenant

Cenários mínimos:

- Usuário de organização A não lê dados da B.
- Usuário sem membership não acessa organização.
- Client Viewer não acessa áreas administrativas.
- Cache não mistura tenants.
- Storage não expõe arquivos entre tenants.

## Testes de workers

Validar:

- Enfileiramento.
- Retry.
- Timeout.
- Idempotência.
- Tarefa presa.
- Falha parcial.
- Reprocessamento.

## Testes de crawlers

Validar:

- Robots.
- Sitemap.
- Redirects.
- Canonicals.
- Status codes.
- Links internos.
- Páginas bloqueadas.
- Timeouts.
- Sites lentos.

## Testes de relatórios

Validar:

- PDF gerado.
- Template correto.
- Dados corretos.
- Marca white-label.
- Gráficos.
- Links.
- Ausência de dados cruzados.

## Testes de IA

Validar:

- JSON schema.
- Campo evidence.
- Campo confidence.
- Não alucinação em casos conhecidos.
- Resposta quando dados faltam.
- Custos dentro do limite.

## Testes de API externa

Usar mocks para:

- Google Search Console.
- GA4.
- Google Ads.
- Meta Ads.
- Google Business Profile.
- DataForSEO.
- WordPress.
- GitHub.

## Ambientes

- Local.
- Test.
- Staging.
- Production.

## Dados de teste

Criar fixtures para:

- Organização.
- Usuários.
- Clientes.
- Sites.
- Auditorias.
- Recomendações.
- Relatórios.
- Integrações.

## Critério mínimo para merge

- Lint passa.
- Typecheck passa.
- Testes unitários passam.
- Testes críticos de backend passam.
- Migrations aplicam limpas.
- Sem segredo no diff.

## Critério para release

- E2E principal passa.
- Teste multi-tenant passa.
- Relatório PDF passa.
- Healthcheck passa.
- Rollback planejado.

## Evolução futura

- Testes de carga.
- Testes de segurança automatizados.
- Testes visuais.
- Contract tests para APIs.
- Testes sintéticos em produção.
- Chaos testing controlado.