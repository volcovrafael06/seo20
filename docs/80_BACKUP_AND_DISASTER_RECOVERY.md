# 80 — Backup and Disaster Recovery

## Objetivo

Definir a estratégia de backup, restauração e recuperação de desastre do SEO20.

## Princípios

- Dados de clientes são críticos.
- Backup deve ser automático.
- Restore deve ser testado.
- Segredos devem ser protegidos.
- Incidentes devem ser documentados.
- Recovery deve priorizar integridade antes de velocidade.

## Escopo

Backups devem cobrir:

- Banco PostgreSQL.
- Storage de relatórios.
- Screenshots.
- Assets de marca.
- Configurações de tenants.
- Configurações de integrações.
- Logs críticos.
- Prompts versionados.
- Documentação operacional.

## Dados críticos

- Organizations.
- Users.
- Memberships.
- Clients.
- Websites.
- Audits.
- Recommendations.
- Reports.
- Integrations.
- Billing records.
- Events.

## RPO e RTO

### RPO

Recovery Point Objective: quantidade máxima aceitável de perda de dados.

Para MVP:

- Banco: até 24 horas.
- Produção madura: até 1 hora ou menor.

### RTO

Recovery Time Objective: tempo máximo aceitável para restaurar operação.

Para MVP:

- Serviço essencial: até 8 horas.
- Produção madura: até 1 ou 2 horas para funções críticas.

## Estratégia de backup

### Banco

- Backup automático diário.
- Point-in-time recovery quando disponível.
- Retenção conforme plano e ambiente.
- Teste periódico de restore.

### Storage

- Versionamento quando possível.
- Backup de relatórios e assets.
- Retenção para arquivos críticos.
- Política de limpeza para temporários.

### Configurações

- Variáveis de ambiente documentadas.
- Segredos armazenados em gerenciador seguro.
- Infraestrutura descrita como código quando possível.

## Frequência sugerida

- Banco produção: diário no MVP.
- Banco staging: diário ou sob demanda.
- Storage reports: diário.
- Assets white-label: diário.
- Logs críticos: retenção configurada.

## Restore test

Periodicidade mínima:

- Mensal no início.
- Quinzenal em operação madura.
- Após mudanças grandes em schema.

Checklist de restore:

- Banco restaurado.
- Usuários e organizações íntegros.
- Relatórios acessíveis.
- Storage montado.
- Integrações permanecem seguras.
- Auditorias consultáveis.
- Aplicação sobe no ambiente restaurado.

## Cenários de desastre

### Banco corrompido

Ações:

1. Pausar writes.
2. Identificar último backup válido.
3. Restaurar em ambiente isolado.
4. Validar integridade.
5. Redirecionar aplicação.
6. Comunicar impacto.

### Deploy destrutivo

Ações:

1. Executar rollback de aplicação.
2. Avaliar migration.
3. Restaurar backup se necessário.
4. Reprocessar filas.
5. Registrar causa raiz.

### Perda de storage

Ações:

1. Verificar escopo da perda.
2. Restaurar arquivos críticos.
3. Regenerar relatórios quando possível.
4. Notificar usuários afetados.

### Vazamento de segredo

Ações:

1. Revogar segredo imediatamente.
2. Gerar novo segredo.
3. Auditar acessos.
4. Verificar logs.
5. Atualizar ambientes.
6. Registrar incidente.

### Fila Redis perdida

Ações:

1. Identificar tasks em andamento.
2. Marcar tasks presas.
3. Reenfileirar tarefas idempotentes.
4. Evitar duplicidade.
5. Validar estados.

## Idempotência

Tarefas críticas devem suportar reexecução segura:

- Crawls.
- Auditorias.
- Geração de relatório.
- Webhook retries.
- Sincronizações.

## Comunicação de incidente

Registrar:

- Hora de início.
- Sistemas afetados.
- Clientes afetados.
- Ações tomadas.
- Status atual.
- Próxima atualização.
- Causa raiz após investigação.

## Segurança dos backups

- Backups devem ser criptografados.
- Acesso restrito.
- Logs de acesso.
- Retenção definida.
- Exclusão segura.
- Nunca expor backups em storage público.

## Responsabilidades

- Owner técnico: plano de restore.
- DevOps: infraestrutura.
- Backend: integridade dos dados.
- Produto: comunicação de impacto.
- Suporte: resposta ao cliente.

## Evolução futura

- PITR obrigatório.
- Backups cross-region.
- Disaster recovery automatizado.
- Runbooks executáveis.
- Simulados trimestrais.
- Infraestrutura como código.
- Monitoramento de backup failed.
- Auditoria de restore.