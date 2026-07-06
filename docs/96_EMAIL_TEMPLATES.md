# 96 — Email Templates

## Objetivo

Definir padrões para e-mails transacionais, operacionais e comerciais do SEO20.

## Princípios

- Linguagem objetiva.
- Identidade white-label quando aplicável.
- Links seguros.
- Não expor dados sensíveis.
- Templates versionados.
- Compatibilidade com desktop e mobile.

## Categorias

### Conta

- Convite de usuário.
- Redefinição de senha.
- Confirmação de e-mail.
- Alteração de papel.

### Auditoria

- Auditoria concluída.
- Auditoria falhou.
- Relatório disponível.
- Reprocessamento finalizado.

### Integrações

- Integração conectada.
- Integração expirada.
- Reconexão necessária.

### Billing

- Trial iniciado.
- Trial encerrando.
- Pagamento confirmado.
- Pagamento falhou.
- Limite atingido.

### Cliente final

- Relatório compartilhado.
- Acesso ao portal.
- Plano de ação atualizado.

## Estrutura padrão

- Assunto.
- Pré-header.
- Saudação.
- Mensagem principal.
- CTA.
- Rodapé.
- Links de suporte.

## Variáveis

- organization_name.
- user_name.
- client_name.
- report_name.
- action_url.
- expiration_date.
- support_email.
- brand_name.

## Segurança

- Links com expiração quando sensíveis.
- Não enviar tokens em texto visível.
- Não incluir segredos.
- Validar destinatário.
- Registrar envio.

## White-label

Aplicar:

- Nome da agência.
- Logo.
- Cores.
- E-mail de suporte.
- Rodapé customizado.

## Métricas

Monitorar:

- Enviados.
- Entregues.
- Falhas.
- Aberturas quando aplicável.
- Cliques quando aplicável.

## Evolução futura

- Editor de templates.
- Testes A/B.
- Templates por idioma.
- Envio por domínio próprio.
- DKIM/SPF/DMARC configurável por agência.