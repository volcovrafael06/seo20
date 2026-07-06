# 81 — Incident Response

## Objetivo

Definir o processo de resposta a incidentes do SEO20 para reduzir impacto operacional, preservar dados, comunicar corretamente e evitar reincidência.

## Definição de incidente

Um incidente é qualquer evento que comprometa ou possa comprometer:

- Disponibilidade da plataforma.
- Integridade dos dados.
- Confidencialidade dos dados.
- Funcionamento de auditorias.
- Geração de relatórios.
- Integrações críticas.
- Segurança multi-tenant.
- Cobrança e assinatura.
- Automações externas.

## Severidades

### SEV1 — Crítico

Impacto grave em produção.

Exemplos:

- Vazamento cross-tenant.
- Plataforma indisponível para todos.
- Perda ou corrupção de dados.
- Segredo exposto.
- Automação executando sem autorização.

### SEV2 — Alto

Impacto relevante, mas com contenção possível.

Exemplos:

- Relatórios falhando para muitos clientes.
- Workers parados.
- Integração crítica indisponível.
- Erro de billing para múltiplas contas.

### SEV3 — Médio

Impacto parcial ou degradado.

Exemplos:

- Uma integração falha para alguns clientes.
- Lentidão elevada.
- Fila acumulada.
- PDF falha em casos específicos.

### SEV4 — Baixo

Problemas pontuais sem impacto amplo.

Exemplos:

- Bug visual.
- Mensagem de erro incorreta.
- Pequena inconsistência em relatório.

## Papéis

### Incident Commander

Coordena resposta, prioriza ações e mantém comunicação.

### Technical Lead

Investiga causa técnica e orienta correção.

### Communications Owner

Prepara comunicação interna e externa.

### Scribe

Registra timeline, decisões e evidências.

## Ciclo de resposta

1. Detectar.
2. Classificar severidade.
3. Conter impacto.
4. Investigar causa.
5. Corrigir.
6. Validar recuperação.
7. Comunicar resolução.
8. Fazer postmortem.

## Primeiros 15 minutos

Checklist:

- Confirmar que o incidente é real.
- Definir severidade.
- Definir Incident Commander.
- Criar canal de incidente.
- Pausar automações perigosas se necessário.
- Preservar logs.
- Iniciar timeline.

## Contenção

Ações possíveis:

- Desabilitar feature flag.
- Pausar workers.
- Bloquear integração afetada.
- Revogar segredo.
- Ativar modo somente leitura.
- Reverter deploy.
- Limitar tráfego.
- Desativar automação externa.

## Comunicação

Comunicação deve ser:

- Clara.
- Objetiva.
- Sem especulação.
- Com status atual.
- Com próxima atualização.
- Com impacto conhecido.

## Template de atualização interna

```text
Status: investigando/contenção/mitigado/resolvido
Severidade: SEV
Impacto: descrição objetiva
Início: horário
Ações em andamento: lista
Próxima atualização: horário
Responsável: nome
```

## Postmortem

Todo SEV1 e SEV2 exige postmortem.

Campos:

- Resumo.
- Timeline.
- Impacto.
- Causa raiz.
- O que funcionou.
- O que falhou.
- Ações corretivas.
- Responsáveis.
- Prazos.

## Incidentes de segurança

Para suspeita de segurança:

- Revogar credenciais afetadas.
- Preservar logs.
- Evitar apagar evidências.
- Restringir acesso.
- Avaliar necessidade de comunicação legal/LGPD.
- Documentar escopo.

## Incidentes de dados

Para perda ou corrupção:

- Pausar writes quando necessário.
- Identificar escopo.
- Restaurar backup em ambiente isolado.
- Validar integridade.
- Reconciliar dados.
- Comunicar usuários afetados.

## Métricas

Monitorar:

- MTTA: tempo para reconhecer.
- MTTR: tempo para resolver.
- Número de incidentes por severidade.
- Reincidência.
- Tempo até comunicação.
- Ações corretivas concluídas.

## Regra final

Correção rápida não encerra incidente. O incidente só termina quando o serviço é validado, impacto é conhecido e ações preventivas foram registradas.