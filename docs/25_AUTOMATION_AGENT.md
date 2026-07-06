# 25 — Automation Agent

## Objetivo

O Automation Agent transforma recomendações aprovadas em ações executáveis. Ele é a ponte entre diagnóstico e execução.

## Regra principal

Nenhuma ação que altere site, campanha, conta de anúncio, repositório ou perfil do cliente deve ser executada sem aprovação humana explícita.

## Entradas

- Recomendação aprovada.
- Cliente.
- Integrações disponíveis.
- Permissões do usuário.
- Dados técnicos necessários.
- Histórico de ações.

## Tipos de ação

### WordPress

- Atualizar title e meta description.
- Criar página de serviço.
- Criar artigo.
- Adicionar FAQ.
- Ajustar headings.
- Atualizar conteúdo.

### GitHub

- Abrir issue.
- Criar branch.
- Criar pull request.
- Alterar arquivos de SEO.
- Atualizar landing page.

### Google Ads

- Gerar estrutura de campanha.
- Sugerir palavras-chave.
- Sugerir negativas.
- Gerar copies.
- Preparar campanha em rascunho.

### Meta Ads

- Sugerir públicos.
- Gerar copies.
- Sugerir criativos.
- Preparar estrutura de campanha.

### Backlinks

- Gerar lista de prospecção.
- Gerar e-mails de outreach.
- Preparar cadastro em diretórios confiáveis.

## Fluxo de aprovação

1. Usuário seleciona recomendação.
2. Sistema mostra ação proposta.
3. Usuário revisa.
4. Usuário aprova.
5. Automation Agent executa.
6. Sistema salva log.
7. Usuário recebe resultado.

## Logs

Cada ação deve registrar:

- Quem aprovou.
- Quando aprovou.
- O que foi alterado.
- Antes e depois.
- Integração usada.
- Resultado.
- Erro, se houver.

## Rollback

Sempre que possível, armazenar estado anterior para reversão.

Exemplos:

- Conteúdo antigo do WordPress.
- Branch/commit no GitHub.
- Campanha em rascunho antes de publicar.

## Estados da ação

- draft.
- waiting_approval.
- approved.
- running.
- completed.
- failed.
- reverted.

## Segurança

- Verificar permissão do usuário.
- Validar integração.
- Evitar ações destrutivas.
- Usar rascunhos sempre que possível.
- Nunca apagar campanhas ou páginas automaticamente.

## Fase MVP

No MVP, o Automation Agent apenas cria tarefas e rascunhos. Execução direta entra em fase posterior.