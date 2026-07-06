# 89 — Storage and File Management

## Objetivo

Definir como o SEO20 armazenará, organizará e protegerá arquivos de relatórios, screenshots, exports, assets de marca e arquivos temporários.

## Princípios

- Todo arquivo de tenant deve ser isolado por `organization_id`.
- Arquivos privados não devem ficar públicos por padrão.
- URLs compartilháveis devem ter expiração ou permissão explícita.
- Metadados dos arquivos devem ficar no banco.
- Arquivos temporários devem ter limpeza automática.

## Tipos de arquivo

- Relatórios PDF.
- Screenshots de auditoria.
- Exports CSV/JSON.
- Logos e assets white-label.
- Arquivos temporários de renderização.

## Buckets sugeridos

- `reports`.
- `screenshots`.
- `exports`.
- `brand-assets`.
- `temp`.
- `imports`.

## Estrutura de path

Formato recomendado:

```text
{organization_id}/{client_id}/{resource_type}/{resource_id}/{filename}
```

Exemplos:

```text
org_123/client_456/reports/report_789/seo-audit.pdf
org_123/client_456/screenshots/audit_789/home-desktop.png
org_123/brand-assets/logo.png
org_123/temp/job_abc/render.html
```

## Tabela de metadados

Tabela sugerida: `files`.

Campos:

- id.
- organization_id.
- client_id.
- owner_user_id.
- bucket.
- path.
- filename.
- mime_type.
- size_bytes.
- file_type.
- visibility.
- checksum.
- related_entity_type.
- related_entity_id.
- expires_at.
- created_at.
- deleted_at.

## Visibilidade

### private

Acesso somente autenticado e autorizado.

### signed_url

Acesso por URL temporária.

### shared

Arquivo compartilhado intencionalmente.

### public_asset

Usado apenas para assets públicos, como logotipo white-label.

## Regras de acesso

- Validar `organization_id`.
- Validar papel do usuário.
- Validar acesso ao cliente quando aplicável.
- Gerar URL temporária somente para usuário autorizado.
- Registrar acesso a relatórios importantes.

## Retenção

Sugestão inicial:

- `temp`: expiração curta.
- `exports`: expiração curta ou média.
- `screenshots`: conforme retenção da auditoria.
- `reports`: retenção longa conforme plano.
- `brand-assets`: até substituição ou exclusão.

## Limpeza automática

Scheduler deve remover:

- Arquivos temporários expirados.
- Exports antigos.
- Screenshots órfãos.
- Arquivos sem referência válida.

## Relatórios

Relatórios PDF devem possuir:

- Registro no banco.
- Versão do template.
- Data de geração.
- Status.
- Relação com auditoria e cliente.

## Screenshots

Screenshots devem ser vinculados a:

- audit_id.
- page_id.
- viewport.
- timestamp.
- evidência relacionada.

## Uploads

Uploads devem validar:

- Tipo de arquivo permitido.
- Tamanho máximo.
- Organização do usuário.
- Nome seguro para armazenamento.

## Segurança

- Não usar bucket público para dados sensíveis.
- Não expor paths internos sem necessidade.
- Sanitizar nomes de arquivo.
- Usar URLs temporárias para arquivos privados.
- Manter isolamento por tenant.

## White-label

Assets de marca devem ser isolados por organização e podem possuir versionamento para evitar cache visual incorreto.

## Evolução futura

- CDN.
- Políticas automáticas de expiração.
- Versionamento de arquivos.
- Exportação completa por cliente.
- Storage analytics.
- Arquivamento de longo prazo.