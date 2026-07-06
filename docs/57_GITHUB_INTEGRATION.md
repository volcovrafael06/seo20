# 57 — GitHub Integration

## Objetivo

Documentar a integração do SEO20 com GitHub para abrir issues, branches, pull requests e apoiar correções técnicas em sites versionados.

## Casos de uso

- Abrir issue a partir de recomendação.
- Criar branch para correção.
- Alterar arquivos de SEO.
- Criar pull request.
- Anexar relatório ou evidências.
- Registrar status da correção.

## Escopo inicial

No MVP, a integração deve criar issues e registrar tarefas técnicas. Alterações automáticas em código ficam para fase posterior.

## Dados necessários

- Organização/usuário GitHub.
- Repositório.
- Branch padrão.
- Caminhos relevantes.
- Permissões da integração.

## Ações futuras

- Criar PR para alterar meta tags.
- Criar PR para adicionar schema.
- Criar PR para ajustar sitemap/robots.
- Criar PR para landing pages.
- Criar PR para melhorias de performance.

## Segurança

- Nunca executar merge automaticamente.
- Criar PR sempre revisável.
- Registrar diff.
- Exigir aprovação humana.
- Usar branch por alteração.
- Manter rastreabilidade com recommendation_id.

## Fluxo

1. Usuário aprova recomendação técnica.
2. Automation Agent identifica repositório.
3. Sistema cria issue ou branch.
4. Sistema prepara alteração.
5. Sistema abre PR.
6. Desenvolvedor revisa.
7. Após merge, SEO20 marca ação como concluída.

## Integração com agentes

- Automation Agent prepara plano.
- SEO Agent sugere correção.
- Report Agent documenta o impacto.
- Strategy Agent prioriza.