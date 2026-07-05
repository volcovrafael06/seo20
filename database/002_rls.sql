-- SEO20 — RLS inicial
-- Isolamento por organização.

alter table public.organizations enable row level security;
alter table public.profiles enable row level security;
alter table public.clients enable row level security;
alter table public.audits enable row level security;
alter table public.audit_tasks enable row level security;
alter table public.keywords enable row level security;
alter table public.competitors enable row level security;
alter table public.serp_results enable row level security;
alter table public.recommendations enable row level security;
alter table public.reports enable row level security;

create or replace function public.current_org_id()
returns uuid
language sql
security definer
as $$
  select organization_id from public.profiles where id = auth.uid()
$$;

create policy "profiles_select_own_org" on public.profiles
for select using (organization_id = public.current_org_id() or id = auth.uid());

create policy "organizations_select_own" on public.organizations
for select using (id = public.current_org_id());

create policy "clients_select_own_org" on public.clients
for select using (organization_id = public.current_org_id());

create policy "clients_insert_own_org" on public.clients
for insert with check (organization_id = public.current_org_id());

create policy "clients_update_own_org" on public.clients
for update using (organization_id = public.current_org_id());

create policy "audits_select_own_org" on public.audits
for select using (organization_id = public.current_org_id());

create policy "audits_insert_own_org" on public.audits
for insert with check (organization_id = public.current_org_id());

create policy "audits_update_own_org" on public.audits
for update using (organization_id = public.current_org_id());

create policy "audit_tasks_select_by_audit_org" on public.audit_tasks
for select using (
  exists (
    select 1 from public.audits a
    where a.id = audit_tasks.audit_id
    and a.organization_id = public.current_org_id()
  )
);

create policy "keywords_select_own_org" on public.keywords
for select using (organization_id = public.current_org_id());

create policy "keywords_insert_own_org" on public.keywords
for insert with check (organization_id = public.current_org_id());

create policy "competitors_select_own_org" on public.competitors
for select using (organization_id = public.current_org_id());

create policy "competitors_insert_own_org" on public.competitors
for insert with check (organization_id = public.current_org_id());

create policy "serp_results_select_by_audit_org" on public.serp_results
for select using (
  exists (
    select 1 from public.audits a
    where a.id = serp_results.audit_id
    and a.organization_id = public.current_org_id()
  )
);

create policy "recommendations_select_by_audit_org" on public.recommendations
for select using (
  exists (
    select 1 from public.audits a
    where a.id = recommendations.audit_id
    and a.organization_id = public.current_org_id()
  )
);

create policy "reports_select_by_audit_org" on public.reports
for select using (
  exists (
    select 1 from public.audits a
    where a.id = reports.audit_id
    and a.organization_id = public.current_org_id()
  )
);

-- Observação: workers backend devem usar service role em ambiente seguro.
-- Nunca expor service role no frontend.
