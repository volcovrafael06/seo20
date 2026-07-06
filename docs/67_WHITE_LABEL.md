# 67 — White Label

## Objetivo

Definir como o SEO20 poderá operar em modo white-label para agências, permitindo personalização de marca, domínio e experiência visual.

## Escopo

White-label deve permitir que uma agência entregue relatórios e dashboards com sua própria identidade, sem expor a marca SEO20 ao cliente final.

## Recursos principais

- Logo da agência.
- Nome comercial.
- Cores primárias.
- Cores secundárias.
- Domínio customizado.
- Remetente de e-mail customizado.
- Relatórios PDF com marca da agência.
- Portal do cliente com identidade da agência.

## Entidades

- white_label_settings.
- brand_assets.
- custom_domains.
- email_senders.
- report_templates.

## Configurações de marca

Campos sugeridos:

- organization_id.
- brand_name.
- logo_url.
- favicon_url.
- primary_color.
- secondary_color.
- accent_color.
- support_email.
- custom_domain.
- footer_text.

## Domínio customizado

Fluxo:

1. Agência informa domínio.
2. Sistema gera instrução DNS.
3. Agência configura CNAME.
4. Sistema valida DNS.
5. Certificado SSL é provisionado.
6. Domínio é ativado.

## Relatórios

Relatórios devem usar:

- Logo da agência.
- Cores da agência.
- Nome da agência.
- Dados do cliente.
- Rodapé personalizável.

## Restrições

- White-label não deve quebrar segurança multi-tenant.
- Assets devem ser isolados por organização.
- Domínio customizado deve apontar apenas para a organização correta.
- Logs internos podem manter referência ao SEO20.

## Planos

White-label pode ser recurso dos planos:

- Agency.
- Enterprise.

## Interface

Tela de configuração deve permitir:

- Upload de logo.
- Definir cores.
- Pré-visualizar relatório.
- Configurar domínio.
- Configurar e-mail.
- Testar identidade visual.

## Futuro

- Templates personalizados por cliente.
- Múltiplas marcas por agência.
- White-label de e-mails transacionais.
- Subcontas para franquias.
- Portal do cliente final.