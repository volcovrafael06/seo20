# 36 — Multi-tenancy

O SEO20 será multiempresa.

Cada organização terá:
- usuários
- clientes
- auditorias
- integrações
- relatórios
- base RAG
- configurações

Todo isolamento será realizado por organization_id e políticas RLS do Supabase.

Nenhum usuário poderá acessar dados de outra organização.