# 76 — Evaluation and QA

## Objetivo

Definir o processo de avaliação de qualidade do SEO20 para garantir que auditorias, recomendações, relatórios, agentes de IA, integrações e automações entreguem resultados confiáveis.

## Escopo

A avaliação cobre:

- Motores determinísticos.
- Agentes de IA.
- Relatórios.
- Integrações externas.
- Dashboards.
- API.
- Automações.
- Segurança multi-tenant.
- Experiência do usuário.

## Princípios

- Nenhum achado crítico deve aparecer sem evidência.
- Nenhuma recomendação deve prometer resultado garantido.
- Nenhuma automação externa deve executar sem regra clara de aprovação.
- Métricas devem ser reproduzíveis.
- Saídas de IA devem ser auditáveis.
- QA deve testar precisão, clareza, segurança e utilidade comercial.

## Tipos de avaliação

### Avaliação técnica

Verifica se o sistema detecta corretamente problemas como:

- Titles ausentes.
- Meta descriptions duplicadas.
- Canonicals incorretos.
- Páginas não indexáveis.
- Headings inconsistentes.
- Links quebrados.
- Problemas de schema.
- Baixa performance.
- Problemas mobile.

### Avaliação estratégica

Verifica se a priorização faz sentido considerando:

- Impacto estimado.
- Esforço.
- Urgência.
- Dependências.
- Potencial comercial.
- Risco.

### Avaliação de IA

Verifica:

- JSON válido.
- Ausência de alucinação.
- Uso correto de evidências.
- Linguagem apropriada.
- Coerência da recomendação.
- Separação entre fato e hipótese.
- Qualidade da explicação.

### Avaliação de relatório

Verifica:

- Clareza para decisores.
- Precisão técnica.
- Ordem lógica.
- Ausência de contradições.
- Presença de próximos passos.
- Consistência visual.

## Golden datasets

Criar conjuntos fixos de teste:

- Site pequeno com problemas conhecidos.
- Site local com GBP incompleto.
- E-commerce com problemas de indexação.
- Landing page com problemas de CRO.
- Cliente com Ads ativo.
- Site com schema correto.
- Site com erros de canonical.

## Métricas de qualidade

- Precision dos achados.
- Recall dos achados.
- Taxa de falsos positivos.
- Taxa de falsos negativos.
- Taxa de JSON válido.
- Taxa de recomendação aceita.
- Tempo de geração.
- Custo por relatório.
- Satisfação do usuário.

## Avaliação humana

QA manual deve revisar amostras de:

- Auditorias completas.
- Relatórios PDF.
- Recomendações críticas.
- Saídas de IA.
- Automação proposta.

## Checklist de QA por auditoria

- Scores calculados corretamente.
- Achados possuem evidência.
- Recomendações são acionáveis.
- Prioridades fazem sentido.
- Relatório está consistente.
- Não há dados de outro cliente.
- Não há segredo exposto.
- Linguagem está adequada.

## QA de multi-tenant

Testar obrigatoriamente:

- Usuário A não acessa organização B.
- Cliente final só vê relatórios permitidos.
- Storage usa paths isolados.
- Cache contém organization_id.
- RLS bloqueia dados indevidos.

## QA de integrações

Testar:

- Token expirado.
- Token revogado.
- API fora do ar.
- Rate limit.
- Dados incompletos.
- Erro parcial.
- Reprocessamento.

## QA de automações

Toda automação deve ser validada com:

- Entrada.
- Ação proposta.
- Permissão necessária.
- Aprovação requerida.
- Resultado esperado.
- Rollback quando aplicável.

## Critérios de bloqueio

Um release deve ser bloqueado quando houver:

- Vazamento cross-tenant.
- Falha em autenticação/autorização.
- Score crítico incorreto.
- Relatório com dados de outro cliente.
- Automação executando sem aprovação.
- Falha recorrente em geração de PDF.

## Evolução futura

- Eval automatizado de agentes.
- Comparação entre modelos.
- Painel de qualidade.
- Feedback loop por usuário.
- Testes sintéticos recorrentes.
- Auditoria externa de segurança.