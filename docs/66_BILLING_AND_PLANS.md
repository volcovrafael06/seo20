# 66 — Billing and Plans

## Objetivo

Definir a estrutura de planos, cobrança, limites de uso e regras comerciais do SEO20 como SaaS.

## Princípios

- Cada plano deve limitar custo operacional.
- Recursos de IA e APIs externas devem ter controle de consumo.
- O sistema deve ser multi-tenant desde o início.
- Planos devem ser simples para venda e claros para operação.

## Entidades principais

- Plan.
- Subscription.
- Invoice.
- Payment Method.
- Usage Record.
- Credit Balance.
- Billing Event.

## Modelo de planos

### Starter

Para pequenas empresas e agências testando a plataforma.

Limites sugeridos:

- Poucos clientes.
- Auditorias mensais limitadas.
- Relatórios básicos.
- Integrações principais.
- IA com limite reduzido.

### Growth

Para agências em operação.

Inclui:

- Mais clientes.
- Auditorias recorrentes.
- Relatórios personalizados.
- Search Console, GA4, GBP, Ads.
- Opportunity Center.
- IA assistida.

### Agency

Para agências que precisam escalar.

Inclui:

- White-label básico.
- Mais usuários.
- Mais auditorias.
- Automação assistida.
- Integrações avançadas.
- Histórico ampliado.

### Enterprise

Para operação customizada.

Inclui:

- Contrato específico.
- Limites personalizados.
- SLA.
- Suporte prioritário.
- Domínio customizado.
- Segurança avançada.

## Métricas de uso

- Número de organizações.
- Número de clientes.
- Número de sites.
- Auditorias completas.
- Crawls.
- PDFs gerados.
- Chamadas de IA.
- Tokens consumidos.
- Chamadas de APIs externas.
- Integrações conectadas.
- Usuários ativos.

## Regras de cobrança

- Cobrança recorrente mensal ou anual.
- Plano define limites base.
- Excedentes podem ser bloqueados ou cobrados conforme política.
- Recursos pagos por consumo devem ter alerta antes do limite.

## Billing Events

Eventos relevantes:

- SubscriptionCreated.
- SubscriptionUpdated.
- SubscriptionCancelled.
- InvoicePaid.
- InvoiceFailed.
- UsageLimitReached.
- TrialStarted.
- TrialExpired.

## Integração futura

Gateways possíveis:

- Stripe.
- Asaas.
- Mercado Pago.
- Pagar.me.

## Segurança

- Não armazenar dados sensíveis de cartão.
- Usar gateway certificado.
- Registrar eventos de billing.
- Aplicar RBAC para páginas de cobrança.
- Bloquear recursos sem apagar dados.

## Regras operacionais

- Trial deve ter limites reduzidos.
- Cancelamento não deve excluir dados imediatamente.
- Inadimplência deve aplicar grace period.
- Downgrade deve validar limites atuais.
- Upgrade deve liberar recursos imediatamente quando confirmado.

## Saídas para produto

- Tela de planos.
- Tela de assinatura.
- Tela de consumo.
- Alertas de limite.
- Histórico de invoices.
- Controles administrativos.