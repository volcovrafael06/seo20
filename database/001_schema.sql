-- SEO20 — schema inicial Supabase
-- Este arquivo cria as tabelas principais do MVP.

create extension if not exists "uuid-ossp";
create extension if not exists vector;

create table if not exists public.organizations (
  id uuid primary key default uuid_generate_v4(),
  name text not null,
  slug text not null unique,
  plan text not null default 'internal',
  status text not null default 'active',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  organization_id uuid references public.organizations(id) on delete cascade,
  full_name text,
  avatar_url text,
  role text not null default 'analyst',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.clients (
  id uuid primary key default uuid_generate_v4(),
  organization_id uuid not null references public.organizations(id) on delete cascade,
  name text not null,
  domain text,
  website_url text,
  city text,
  state text,
  country text default 'BR',
  segment text,
  description text,
  status text not null default 'active',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.audits (
  id uuid primary key default uuid_generate_v4(),
  organization_id uuid not null references public.organizations(id) on delete cascade,
  client_id uuid not null references public.clients(id) on delete cascade,
  audit_type text not null default 'full',
  status text not null default 'pending',
  started_at timestamptz,
  finished_at timestamptz,
  score_general numeric,
  score_seo numeric,
  score_local numeric,
  score_backlinks numeric,
  score_ads numeric,
  score_cro numeric,
  score_geo numeric,
  report_url text,
  raw_summary text,
  created_at timestamptz not null default now()
);

create table if not exists public.audit_tasks (
  id uuid primary key default uuid_generate_v4(),
  audit_id uuid not null references public.audits(id) on delete cascade,
  task_type text not null,
  status text not null default 'pending',
  progress integer not null default 0,
  error_message text,
  metadata jsonb not null default '{}'::jsonb,
  started_at timestamptz,
  finished_at timestamptz,
  created_at timestamptz not null default now()
);

create table if not exists public.keywords (
  id uuid primary key default uuid_generate_v4(),
  organization_id uuid not null references public.organizations(id) on delete cascade,
  client_id uuid references public.clients(id) on delete cascade,
  audit_id uuid references public.audits(id) on delete cascade,
  keyword text not null,
  source text,
  volume integer,
  cpc numeric,
  difficulty numeric,
  intent text,
  local_modifier text,
  priority integer,
  created_at timestamptz not null default now()
);

create table if not exists public.competitors (
  id uuid primary key default uuid_generate_v4(),
  organization_id uuid not null references public.organizations(id) on delete cascade,
  client_id uuid references public.clients(id) on delete cascade,
  audit_id uuid references public.audits(id) on delete cascade,
  name text,
  domain text,
  website_url text,
  google_business_url text,
  source text,
  organic_frequency integer default 0,
  maps_frequency integer default 0,
  priority integer,
  created_at timestamptz not null default now()
);

create table if not exists public.serp_results (
  id uuid primary key default uuid_generate_v4(),
  audit_id uuid references public.audits(id) on delete cascade,
  keyword_id uuid references public.keywords(id) on delete cascade,
  position integer,
  title text,
  url text,
  domain text,
  snippet text,
  is_ad boolean default false,
  is_featured boolean default false,
  captured_at timestamptz not null default now()
);

create table if not exists public.recommendations (
  id uuid primary key default uuid_generate_v4(),
  audit_id uuid not null references public.audits(id) on delete cascade,
  module text not null,
  title text not null,
  description text,
  impact text,
  effort text,
  priority integer,
  status text default 'open',
  evidence jsonb default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create table if not exists public.reports (
  id uuid primary key default uuid_generate_v4(),
  audit_id uuid not null references public.audits(id) on delete cascade,
  title text not null,
  file_url text,
  html_url text,
  version integer not null default 1,
  created_at timestamptz not null default now()
);

create index if not exists idx_clients_org on public.clients(organization_id);
create index if not exists idx_audits_client on public.audits(client_id);
create index if not exists idx_audit_tasks_audit on public.audit_tasks(audit_id);
create index if not exists idx_keywords_audit on public.keywords(audit_id);
create index if not exists idx_competitors_audit on public.competitors(audit_id);
create index if not exists idx_recommendations_audit on public.recommendations(audit_id);
