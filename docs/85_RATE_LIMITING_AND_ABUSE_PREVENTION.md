# 85 — Rate Limiting and Abuse Prevention

## Objetivo

Definir mecanismos de rate limiting, quotas, proteção contra abuso e controle de consumo no SEO20.

## Princípios

- Proteger a plataforma contra abuso acidental ou malicioso.
- Controlar custos de APIs externas e IA.
- Preservar disponibilidade para todos os tenants.
- Aplicar limites por plano, organização, usuário, endpoint e tipo de tarefa.
- Dar feedback claro quando um limite for atingido.

## Superfícies protegidas

- API pública.
- API interna.
- Login.
- Cadastro.
- Geração de auditorias.
- Crawlers.
- Relatórios PDF.
- Chamadas de IA.
- Webhooks.
- Integrações externas.
- Exportações.
- Uploads.

## Tipos de limite

### Por IP

Usado para proteger login, cadastro e endpoints públicos.

### Por usuário

Limita ações por usuário autenticado.

### Por organização

Controla consumo total do tenant.

### Por plano

Define limites comerciais de uso.

### Por endpoint

Protege rotas caras ou sensíveis.

### Por tarefa

Controla auditorias, crawls, PDFs, IA e integrações.

## Exemplos de limites

- Tentativas de login por IP.
- Auditorias completas por mês.
- Crawls simultâneos por organização.
- PDFs por dia.
- Tokens de IA por mês.
- Webhook deliveries por minuto.
- Chamadas de API pública por minuto.
- Uploads por hora.

## Estratégias

### Fixed window

Simples, bom para limites mensais e diários.

### Sliding window

Melhor para proteção de endpoints em curto prazo.

### Token bucket

Bom para permitir rajadas controladas.

### Concurrent limits

Necessário para crawls, workers e relatórios.

## Resposta padrão

Ao atingir limite, retornar:

- HTTP 429.
- Código de erro.
- Mensagem clara.
- Retry-After quando aplicável.
- Limite atual.
- Plano necessário quando for recurso comercial.

## Quotas comerciais

Planos devem controlar:

- Clientes.
- Sites.
- Auditorias.
- Integrações.
- Relatórios.
- Usuários.
- IA.
- Storage.

## Proteção de IA

Medidas:

- Limite mensal de tokens.
- Limite por execução.
- Cache por input hash.
- Bloqueio de loops.
- Fallback para modelo mais barato.
- Alertas de consumo.

## Proteção de crawlers

Medidas:

- Limitar páginas por crawl.
- Limitar profundidade.
- Respeitar robots quando aplicável.
- Timeout por página.
- Limite de concorrência.
- Bloqueio de domínios problemáticos.

## Proteção de webhooks

Medidas:

- Limite por endpoint.
- Retentativas com backoff.
- Pausar endpoint com falha recorrente.
- Assinatura HMAC.

## Proteção contra abuso

Detectar:

- Login brute force.
- Criação massiva de contas.
- Disparo excessivo de auditorias.
- Uso anormal de IA.
- Exportações repetidas.
- Webhooks falhando em loop.
- Tentativas de acessar outros tenants.

## Ações automáticas

- Rate limit.
- Captcha futuro.
- Bloqueio temporário.
- Pausa de jobs.
- Alerta para admin.
- Exigir reautenticação.
- Suspensão manual em casos graves.

## Observabilidade

Métricas:

- 429 por endpoint.
- Consumo por tenant.
- Jobs bloqueados por limite.
- Custo evitado por cache.
- Tentativas suspeitas.
- Picos de uso.

## Admin

Tela administrativa deve mostrar:

- Uso atual por organização.
- Limites do plano.
- Histórico de consumo.
- Alertas.
- Bloqueios aplicados.
- Possibilidade de ajuste manual enterprise.

## Evolução futura

- WAF.
- Detecção de anomalias por ML.
- Score de risco por sessão.
- Limites adaptativos.
- Integração com billing em tempo real.
- Quotas customizadas enterprise.