# 82 — Privacy and LGPD

## Objetivo

Definir diretrizes técnicas e operacionais de privacidade para o SEO20.

## Escopo

A plataforma manipula dados de usuários, organizações, clientes, sites, relatórios, auditorias, integrações autorizadas, logs operacionais e eventos do sistema.

## Princípios

- Coletar somente dados necessários.
- Informar a finalidade do uso.
- Manter isolamento por organização.
- Proteger dados em trânsito e em repouso.
- Registrar acessos relevantes.
- Permitir revogação de integrações.
- Permitir exportação e exclusão conforme política aplicável.

## Categorias de dados

### Conta

- Nome.
- E-mail.
- Organização.
- Papel.
- Status de acesso.

### Operação

- Clientes cadastrados.
- Sites auditados.
- Auditorias.
- Recomendações.
- Relatórios.
- Eventos.

### Integrações

- Identificadores de contas conectadas.
- Status de conexão.
- Métricas importadas por autorização do usuário.

## Minimização

O sistema não deve solicitar dados pessoais desnecessários para auditoria SEO, GEO, CRO, Ads ou relatórios.

## Retenção

A retenção deve variar por tipo de dado e plano contratado. Dados temporários devem possuir política de expiração.

## Direitos do usuário

O produto deve prever fluxos para:

- Consultar dados vinculados à conta.
- Exportar informações.
- Corrigir dados cadastrais.
- Revogar integrações.
- Solicitar exclusão quando aplicável.

## IA e privacidade

Agentes de IA devem receber apenas o contexto necessário para a tarefa. Informações confidenciais devem ser filtradas antes do envio a qualquer provedor externo.

## Segurança

Medidas esperadas:

- HTTPS.
- Controle de acesso por papel.
- Isolamento por organização.
- Logs de auditoria.
- Chaves e credenciais protegidas.
- Backups protegidos.
- Revisões periódicas.

## Privacy by design

Toda nova funcionalidade deve responder:

- Que dado coleta?
- Qual a finalidade?
- Quem acessa?
- Por quanto tempo fica armazenado?
- Como pode ser removido?

## Observação

Este documento é uma diretriz técnica. A operação comercial deve passar por revisão jurídica antes do lançamento público amplo.