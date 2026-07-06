# 84 — Audit Logs

## Objetivo

Definir a arquitetura de logs de auditoria do SEO20 para rastrear ações relevantes, apoiar segurança, compliance, suporte, debugging e resposta a incidentes.

## Princípios

- Logs de auditoria devem ser imutáveis na prática operacional.
- Toda ação sensível deve ser registrada.
- Logs devem estar vinculados a organization_id.
- Logs devem evitar dados sensíveis desnecessários.
- Logs devem ser pesquisáveis por período, usuário, entidade e ação.

## Eventos auditáveis

### Usuários e acesso

- Login bem-sucedido.
- Login falho.
- Logout.
- Convite enviado.
- Usuário removido.
- Papel alterado.
- Membership ativado/desativado.

### Organização

- Organização criada.
- Configuração alterada.
- White-label alterado.
- Domínio customizado alterado.

### Clientes e sites

- Cliente criado.
- Cliente atualizado.
- Cliente excluído.
- Site adicionado.
- Site atualizado.
- Site removido.

### Integrações

- Integração conectada.
- Integração revogada.
- Integração expirada.
- Falha de sincronização.
- Permissão alterada.

### Auditorias

- Auditoria criada.
- Auditoria iniciada.
- Auditoria concluída.
- Auditoria falhou.
- Auditoria reprocessada.

### Relatórios

- Relatório gerado.
- Relatório visualizado.
- Relatório compartilhado.
- Link de compartilhamento revogado.
- PDF baixado.

### Automações

- Automação criada.
- Automação aprovada.
- Automação executada.
- Automação falhou.
- Automação cancelada.

### Billing

- Plano alterado.
- Assinatura criada.
- Assinatura cancelada.
- Pagamento confirmado.
- Falha de pagamento.

## Estrutura do log

Campos sugeridos:

- id.
- organization_id.
- user_id.
- client_id.
- event_type.
- entity_type.
- entity_id.
- action.
- status.
- ip_address.
- user_agent.
- metadata.
- created_at.

## Metadata

Metadata deve incluir somente informações úteis e seguras.

Exemplos:

- Campos alterados.
- Antes/depois resumido.
- Motivo da falha.
- Origem da ação.
- Request ID.

## Redação de dados

Nunca salvar em audit logs:

- Senhas.
- Chaves privadas.
- Tokens de acesso.
- Segredos de integração.
- Dados sensíveis sem necessidade.

## Consulta

Filtros necessários:

- Organização.
- Usuário.
- Cliente.
- Tipo de evento.
- Entidade.
- Período.
- Status.

## Retenção

Retenção deve variar por plano e tipo de evento.

Sugestão inicial:

- Eventos críticos: retenção longa.
- Eventos operacionais: retenção média.
- Logs técnicos detalhados: retenção menor.

## Uso em suporte

Suporte deve conseguir responder:

- Quem gerou este relatório?
- Quem conectou esta integração?
- Quem aprovou esta automação?
- Quando uma auditoria falhou?
- Qual usuário alterou o papel?

## Uso em segurança

Segurança deve conseguir detectar:

- Acesso incomum.
- Muitas falhas de login.
- Revogação suspeita.
- Alterações administrativas fora do padrão.
- Compartilhamento incomum de relatórios.

## Integridade

Medidas futuras:

- Append-only.
- Hash encadeado.
- Exportação para storage imutável.
- Assinatura de logs críticos.

## Interface

Tela de audit logs deve existir para owners/admins autorizados com:

- Busca.
- Filtros.
- Exportação.
- Detalhes do evento.
- Link para entidade relacionada.

## Evolução futura

- Alertas em tempo real.
- Detecção de anomalias.
- Exportação SIEM.
- Webhooks de eventos críticos.
- Retenção customizada enterprise.