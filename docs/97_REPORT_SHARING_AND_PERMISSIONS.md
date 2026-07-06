# 97 — Report Sharing and Permissions

## Objetivo

Definir como relatórios do SEO20 serão compartilhados com segurança entre agência, equipe interna e clientes finais.

## Princípios

- Relatórios são privados por padrão.
- Compartilhamento deve ser intencional.
- Links compartilháveis devem ter controle.
- Acesso deve respeitar organização, cliente e papel.
- Todo compartilhamento relevante deve gerar audit log.

## Modos de compartilhamento

### Interno

Usuários autenticados da organização acessam conforme permissão.

### Cliente final

Usuários convidados acessam apenas relatórios vinculados ao seu cliente.

### Link temporário

URL assinada com expiração configurável.

### Portal

Acesso via Customer Portal com login.

## Permissões

Ações:

- Ver relatório.
- Baixar PDF.
- Compartilhar.
- Revogar link.
- Gerar nova versão.
- Arquivar.

## Campos sugeridos

Tabela `report_shares`:

- id.
- organization_id.
- client_id.
- report_id.
- share_type.
- token_hash.
- expires_at.
- created_by.
- revoked_at.
- created_at.

## Segurança

- Armazenar hash do token.
- Expirar links automaticamente.
- Permitir revogação.
- Registrar acessos.
- Não expor path real do storage.
- Validar tenant em todas as consultas.

## Estados

- private.
- shared_internal.
- shared_client.
- link_active.
- link_expired.
- revoked.

## Interface

A tela de relatório deve permitir:

- Copiar link.
- Definir expiração.
- Convidar cliente.
- Revogar acesso.
- Ver histórico de acesso.

## Evolução futura

- Watermark.
- Senha adicional por relatório.
- Aprovação antes de enviar ao cliente.
- Comentários no relatório.
- Assinatura digital de relatório.