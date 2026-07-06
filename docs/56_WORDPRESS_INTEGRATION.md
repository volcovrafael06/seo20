# 56 — WordPress Integration

## Objetivo

Documentar a integração do SEO20 com WordPress para leitura, auditoria e futura execução de correções aprovadas.

## Escopo inicial

- Conectar site WordPress.
- Validar credenciais.
- Listar páginas.
- Listar posts.
- Ler metadados SEO quando plugins forem suportados.
- Criar rascunhos.
- Sugerir atualizações.

## Integrações possíveis

- WordPress REST API.
- Application Passwords.
- Plugins SEO quando disponíveis.
- Webhooks futuros.

## Dados coletados

- Páginas.
- Posts.
- Slugs.
- Status.
- Titles.
- Conteúdo.
- Categorias.
- Tags.
- Imagens destacadas.
- Metadados SEO quando possível.

## Ações futuras

Nenhuma alteração deve ser publicada sem aprovação humana.

Ações possíveis:

- Criar rascunho de página.
- Criar rascunho de post.
- Atualizar title/meta.
- Adicionar FAQ.
- Corrigir headings.
- Inserir schema quando suportado.
- Atualizar links internos.

## Segurança

- Nunca salvar senha comum do usuário.
- Preferir application password ou OAuth quando disponível.
- Criptografar credenciais.
- Registrar logs de antes/depois.
- Permitir revogar conexão.

## Uso no SEO20

A integração alimenta:

- SEO Engine.
- Content Engine.
- Automation Agent.
- Report Engine.

## Fluxo de automação

1. Recommendation é aprovada.
2. Automation Agent gera alteração proposta.
3. Usuário revisa.
4. Sistema cria rascunho ou altera com aprovação explícita.
5. Log é gravado.
6. Resultado é validado.