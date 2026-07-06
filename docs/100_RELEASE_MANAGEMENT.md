# 100 — Release Management

## Objetivo

Definir o processo de gestão de releases do SEO20, incluindo versionamento, changelog, aprovação, deploy, rollback e comunicação.

## Princípios

- Release deve ser rastreável.
- Mudanças devem ter escopo claro.
- Produção deve ter rollback planejado.
- Migrations devem ser tratadas com cuidado.
- Comunicação deve ser proporcional ao impacto.

## Tipos de release

### Patch

Correções pequenas e seguras.

### Minor

Novas funcionalidades compatíveis.

### Major

Mudanças estruturais, breaking changes ou migrações relevantes.

### Hotfix

Correção urgente em produção.

## Checklist de release

- PRs revisados.
- Testes passando.
- Migrations testadas.
- Documentação atualizada.
- Feature flags revisadas.
- Rollback definido.
- Monitoramento preparado.
- Comunicação preparada quando aplicável.

## Versionamento

Usar versionamento semântico quando o produto tiver API pública ou pacotes externos.

Formato:

```text
MAJOR.MINOR.PATCH
```

## Changelog

Categorias:

- Added.
- Changed.
- Fixed.
- Deprecated.
- Removed.
- Security.

## Release notes

Devem incluir:

- Resumo.
- Impacto para usuários.
- Mudanças técnicas.
- Possíveis riscos.
- Ações necessárias.

## Deploy

Fluxo recomendado:

1. Deploy staging.
2. Smoke tests.
3. Aprovação.
4. Deploy produção.
5. Monitoramento.
6. Comunicação.

## Rollback

Plano deve cobrir:

- Aplicação.
- Workers.
- Variáveis.
- Feature flags.
- Migrations.
- Jobs em andamento.

## Hotfix

Hotfix deve ser:

- Pequeno.
- Revisado rapidamente.
- Testado no caminho afetado.
- Documentado depois.

## Métricas pós-release

- Erro 5xx.
- Latência.
- Falhas de worker.
- Falhas de PDF.
- Falhas de IA.
- Reclamações de usuário.
- Logs críticos.

## Evolução futura

- Release train.
- Canary deploy.
- Blue/green deploy.
- Feature rollout progressivo.
- Release notes automáticas.
- Painel de releases.