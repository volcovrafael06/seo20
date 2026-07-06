# 98 — Import and Export System

## Objetivo

Definir recursos de importação e exportação de dados para clientes, auditorias, recomendações, relatórios e configurações operacionais do SEO20.

## Casos de uso

- Importar lista de clientes.
- Importar sites.
- Exportar recomendações.
- Exportar auditoria em CSV/JSON.
- Exportar dados para BI.
- Exportar histórico do cliente.
- Criar pacote de evidências.

## Formatos

- CSV.
- JSON.
- XLSX futuro.
- ZIP futuro.

## Importação

Fluxo:

1. Upload do arquivo.
2. Validação de tipo e tamanho.
3. Preview.
4. Mapeamento de colunas.
5. Validação de linhas.
6. Confirmação.
7. Processamento assíncrono.
8. Relatório de sucesso/falha.

## Exportação

Fluxo:

1. Usuário escolhe escopo.
2. Sistema valida permissão.
3. Worker gera arquivo.
4. Arquivo é salvo no storage.
5. Link temporário é disponibilizado.

## Entidades exportáveis

- Clients.
- Websites.
- Audits.
- Scores.
- Findings.
- Recommendations.
- Reports metadata.
- Integrations status.

## Segurança

- Exportação deve respeitar permissões.
- Arquivos devem expirar.
- Downloads devem gerar audit log.
- Dados de outros tenants nunca podem ser incluídos.
- Arquivos grandes devem ser gerados em background.

## Validação de importação

Validar:

- Campos obrigatórios.
- URLs válidas.
- Duplicidade.
- Limites do plano.
- Formato de e-mail.
- Organização do usuário.

## Estados

- uploaded.
- validating.
- ready_for_review.
- processing.
- completed.
- failed.
- expired.

## Evolução futura

- Importação via Google Sheets.
- Exportação agendada.
- Conector BI.
- Templates de importação.
- API pública para exportação.