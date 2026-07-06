# 34 — OAuth e Integrações

## Integrações suportadas
- Google Search Console
- Google Analytics 4
- Google Ads
- Google Business Profile
- Meta Ads
- WordPress
- GitHub

## Fluxo
1. OAuth2.
2. Armazenar refresh token criptografado.
3. Renovação automática.
4. Revogação pelo usuário.

## Segurança
Nunca expor tokens ao frontend. Todas as chamadas devem ser realizadas pelo backend.