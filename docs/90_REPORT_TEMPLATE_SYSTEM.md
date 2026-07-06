# 90 — Report Template System

## Objetivo

Definir o sistema de templates de relatório do SEO20 para gerar PDFs, dashboards compartilháveis e documentos executivos com consistência, personalização white-label e rastreabilidade.

## Princípios

- Separar dados, template e renderização.
- Manter templates versionados.
- Permitir white-label por organização.
- Garantir consistência visual entre relatórios.
- Permitir seções opcionais conforme tipo de auditoria.
- Registrar qual template foi usado em cada relatório.

## Tipos de relatório

### Auditoria completa

Inclui visão geral, scores, achados técnicos, SEO Local, GEO, CRO, Ads, backlinks, concorrentes e plano de ação.

### Relatório executivo

Foco em diretoria e decisores.

Inclui:

- Resumo.
- Principais oportunidades.
- Riscos.
- Impacto esperado.
- Próximos passos.

### Relatório técnico

Foco em execução operacional.

Inclui:

- URLs afetadas.
- Evidências.
- Prioridades.
- Como corrigir.
- Dependências.

### Relatório comercial

Foco em venda e expansão de contrato.

Inclui:

- Diagnóstico comercial.
- Oportunidades de crescimento.
- Escopo sugerido.
- Plano 30/60/90 dias.

## Arquitetura

Camadas:

1. Data Builder.
2. Template Resolver.
3. Renderer HTML.
4. PDF Generator.
5. Storage Manager.
6. Report Registry.

## Data Builder

Responsável por montar o payload do relatório.

Entradas:

- Audit.
- Scores.
- Findings.
- Recommendations.
- Charts.
- Screenshots.
- Client data.
- White-label settings.

Saída:

- JSON estruturado e validado.

## Template Resolver

Define qual template usar considerando:

- Tipo de relatório.
- Plano.
- Organização.
- White-label.
- Idioma.
- Versão.

## Renderer HTML

Transforma payload em HTML.

Regras:

- CSS embutido ou estável.
- Layout responsivo para preview.
- Compatível com PDF.
- Fontes controladas.
- Imagens otimizadas.

## PDF Generator

Gera PDF a partir do HTML.

Requisitos:

- Cabeçalho.
- Rodapé.
- Numeração de páginas.
- Quebra de página controlada.
- Tabelas legíveis.
- Gráficos renderizados.

## Report Registry

Cada relatório gerado deve registrar:

- id.
- organization_id.
- client_id.
- audit_id.
- report_type.
- template_id.
- template_version.
- status.
- file_id.
- generated_by.
- generated_at.

## Seções padrão

- Capa.
- Sumário executivo.
- Score geral.
- Scores por área.
- Diagnóstico técnico.
- SEO Local.
- GEO.
- CRO.
- Ads.
- Backlinks.
- Concorrentes.
- Plano de ação.
- Apêndice técnico.

## White-label

Aplicar:

- Logo.
- Cores.
- Nome da agência.
- Rodapé.
- Dados de contato.
- Domínio customizado quando aplicável.

## Versionamento

Templates devem possuir:

- template_id.
- version.
- changelog.
- status.
- created_at.
- deprecated_at.

Relatórios antigos devem manter referência à versão usada.

## Personalização

Possibilidades futuras:

- Ativar/desativar seções.
- Reordenar seções.
- Alterar capa.
- Incluir página de proposta.
- Incluir assinatura comercial.
- Criar templates por agência.

## Validação

Antes de gerar PDF:

- Payload deve passar schema.
- Imagens devem estar acessíveis.
- Dados obrigatórios devem existir.
- Template deve estar ativo.
- Usuário deve ter permissão.

## Estados

- draft.
- queued.
- rendering.
- generated.
- failed.
- expired.
- archived.

## Observabilidade

Monitorar:

- Tempo de geração.
- Falhas por template.
- Tamanho do PDF.
- Erros de imagem.
- Erros de layout.
- Downloads.
- Compartilhamentos.

## Segurança

- Relatórios privados por padrão.
- Links compartilháveis devem ser controlados.
- Não misturar dados entre clientes.
- Registrar geração e acesso.
- Respeitar permissões por organização.

## Evolução futura

- Editor visual de templates.
- Marketplace de templates.
- Tradução automática controlada.
- Relatórios interativos.
- Exportação DOCX/PPTX.
- Templates por segmento.
- Comparativo histórico automático.