# 18 — Frontend Next.js

## Objetivo

Definir a estrutura do frontend web do SEO20. A aplicação deve ser responsiva, acessível, rápida e adequada para uso diário por dono de agência, gestores de tráfego, analistas, vendedores e clientes com acesso restrito.

## Stack

- Next.js com App Router.
- React.
- TypeScript.
- Tailwind CSS.
- Supabase Auth.
- TanStack Query para cache de API.
- React Hook Form + Zod para formulários.
- Recharts ou ECharts para gráficos.
- shadcn/ui como base de componentes, se desejado.

## Estrutura sugerida

```txt
frontend/
├── app/
│   ├── (auth)/
│   │   ├── login/
│   │   └── reset-password/
│   ├── (dashboard)/
│   │   ├── dashboard/
│   │   ├── clients/
│   │   ├── audits/
│   │   ├── reports/
│   │   ├── integrations/
│   │   └── settings/
│   ├── layout.tsx
│   └── page.tsx
├── components/
│   ├── ui/
│   ├── charts/
│   ├── layout/
│   ├── clients/
│   ├── audits/
│   └── reports/
├── lib/
│   ├── supabase.ts
│   ├── api.ts
│   ├── auth.ts
│   └── formatters.ts
└── types/
```

## Páginas principais

### Login

- Email e senha.
- Login social futuro.
- Recuperação de senha.
- Estado de erro claro.

### Dashboard

- Score médio dos clientes.
- Auditorias recentes.
- Alertas.
- Clientes com maior risco.
- Oportunidades comerciais.
- Atividades recentes.

### Clientes

- Lista de clientes.
- Filtros por status, segmento e cidade.
- Botão de novo cliente.
- Acesso ao detalhe do cliente.

### Detalhe do cliente

- Dados cadastrais.
- Site.
- Cidade.
- Segmento.
- Auditorias.
- Relatórios.
- Integrações conectadas.
- Recomendações abertas.

### Auditoria

- Status em tempo real.
- Progresso por tarefa.
- Scores.
- Recomendações.
- Concorrentes.
- Palavras-chave.
- Relatório PDF.

### Integrações

- Google Search Console.
- GA4.
- Google Ads.
- Meta Ads.
- WordPress.
- Semrush/Ahrefs/DataForSEO.

### Relatórios

- Lista de PDFs gerados.
- Download.
- Preview.
- Compartilhamento por link assinado.

## Comunicação com API

O frontend deve chamar a FastAPI para operações de negócio. O token Supabase deve ser enviado no header Authorization.

## Estado em tempo real

Para status de auditorias, usar:

- polling curto no MVP; ou
- Supabase Realtime; ou
- WebSocket futuro via FastAPI.

## Regras UX

- Sempre mostrar progresso de auditoria.
- Nunca deixar tela vazia sem orientação.
- Explicar termos técnicos.
- Priorizar ações recomendadas.
- Permitir exportar relatório rapidamente.

## Responsividade

A plataforma deve funcionar bem em desktop e tablet. Mobile deve permitir consulta e acompanhamento, mas operações complexas podem ser otimizadas para desktop.

## Segurança

- Nunca expor service role.
- Não salvar tokens em localStorage quando houver alternativa segura.
- Validar permissões também no backend.
- Ocultar dados de clientes para usuários sem permissão.