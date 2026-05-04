#import "@preview/basic-resume:0.2.9": *

#let name = "Valeriy Grachev"
#let location = "Bangkok · Remote"
#let email = "spelendora@gmail.com"
#let linkedin = "linkedin.com/in/spelendora"
#let personal-site = "spelendora.com/devops"
#let telegram = "t.me/spelendora"

#show: resume.with(
  author: name,
  location: location,
  email: email,
  linkedin: linkedin,
  personal-site: personal-site,
  github: telegram,
  accent-color: "#0d4f4a",
  font: "New Computer Modern",
  paper: "a4",
  author-position: left,
  personal-info-position: left,
)

== Summary

Platform Engineering Lead for #link("https://finchtrade.com")[FinchTrade] / #link("https://finerymarkets.com")[Finery Markets] (CNBC Top 300 Fintech) — a Swiss OTC desk and regulated crypto ECN. Own infrastructure, security, compliance (SOC 2 Type II, ISO 27001, MiCA), and the internal developer platform across 5 AWS regions. Direct report to CEO. *USD 170B+ annual trading volume*, *50% cloud cost reduction*, *zero major incidents in 2+ years* across 24/7 markets.

== Work Experience

#work(
  title: "Platform Engineering Lead",
  location: "Bangkok · Remote",
  company: "FinchTrade / Finery Markets",
  dates: dates-helper(start-date: "Nov 2021", end-date: "Present"),
)
- Own the entire platform engineering function for a Swiss OTC desk and regulated crypto ECN. Report to CEO; lead infrastructure, security, compliance, and developer platform serving 15+ engineers across trading, market-making, and arbitrage teams
- Architected multi-region AWS platform (5 regions, active-active) with domain-isolated EKS clusters enforcing blast-radius boundaries between trading core, OTC, and compliance workloads. 400+ pods, 50+ microservices, 24/7 markets with no maintenance windows
- Built internal developer platform reducing service onboarding from days to minutes: developers write a 15-line `deploy.yaml` and get complete CI/CD with IRSA, secrets management, and database provisioning for 145+ repos. Evaluated Backstage; built purpose-fit tooling (FastAPI + React) due to crypto regulatory constraints
- Achieved 50% cloud cost reduction: Karpenter with Graviton/ARM spot instances, Kubecost for per-team spend attribution, and a custom Slack cost bot for real-time anomaly alerts
- Led organization through SOC 2 Type II and ISO 27001 audits with zero critical findings. MiCA readiness for EU crypto regulation. Nitro Enclaves for custody-adjacent confidential computing, image signing (cosign/Sigstore), Kyverno blocking non-compliant deployments

#work(
  title: "Volunteer DevOps Lead (Part-Time)",
  location: "Remote",
  company: "helpingtoleave.org",
  dates: dates-helper(start-date: "Feb 2022", end-date: "Aug 2023"),
)
- Built and operated infrastructure for one of Ukraine's largest civilian evacuation organizations — *92K+ people assisted*, *16K+ fully guided evacuations* from frontline and occupied territories. Featured by Harvard Ukrainian Research Institute
- Led team of 5 DevOps engineers and coordinated with 30+ tech specialists. Core platform: Telegram bot network serving 300+ volunteers coordinating real-time evacuations across active war zones
- AWS / EKS / CDK infrastructure with full observability stack. Mitigated state-level DDoS attacks via AWS Shield and WAF to keep evacuation services online during active military operations

#work(
  title: "Co-Founder · Head of Product & Engineering",
  location: "Almaty, Kazakhstan",
  company: "AIDU (aidu.me)",
  dates: dates-helper(start-date: "Oct 2020", end-date: "Nov 2021"),
)
- Co-founded B2B marketplace connecting retail stores with service contractors in Kazakhstan. Built from zero to 30K+ customers and 1.3K+ active contractors across 254 service types
- Owned all technical and product decisions: architecture, infrastructure (Kubernetes on GCP), hiring, delivery, and contractor payments. Led team of 10
- Integrated with major retail chains: Alser, Mechta, Leroy Merlin, Sulpak, DNS, Technograd — enabling in-store service sales at checkout

#work(
  title: "Head of Product & Engineering (Contract)",
  location: "Remote",
  company: "EdTech Platform (IIDF Portfolio)",
  dates: dates-helper(start-date: "Oct 2018", end-date: "Nov 2021"),
)
- Built enterprise education platform for Russia's largest startup accelerator (IIDF — 400+ portfolio companies, 6B RUB fund). 30K+ students completed programs through the platform. Led team of 7

#work(
  title: "DevOps Engineer",
  location: "Moscow",
  company: "Fevlake.com",
  dates: dates-helper(start-date: "Oct 2018", end-date: "Oct 2020"),
)
- Built Kubernetes-based infrastructure from scratch for a DevOps consulting firm. Designed and executed monolith-to-microservices migration

#work(
  title: "Linux Administrator",
  location: "Moscow",
  company: "TCEH.com",
  dates: dates-helper(start-date: "Nov 2017", end-date: "Sep 2018"),
)

== Selected Projects

#project(
  name: "Multi-Region Fintech Platform",
  role: "Platform Architecture",
)
- Domain-isolated EKS clusters (trading core, OTC, market guard) enforcing hard blast-radius boundaries for crypto trading. Pulumi (Python) for unit-tested, type-safe infrastructure. Karpenter with Graviton/ARM and spot instances for sub-60s node provisioning during market volatility spikes
- *USD 170B+ annual volume · 5 AWS regions · active-active*

#project(
  name: "Internal Developer Platform (ft-toolbox)",
  role: "Platform Engineering",
)
- Platform-as-a-Product approach: evaluated Backstage, built purpose-fit tooling due to crypto regulatory constraints. FastAPI + React with Claude API for AI-augmented operations — automated Jira digests, cost anomaly narration, Grafana audit that caught disabled SSL on 12/14 Postgres datasources

#project(
  name: "FinOps & Cost Engineering",
  role: "Cost Optimization",
)
- 50% cloud cost reduction across 5 AWS regions. Karpenter with Graviton/ARM and spot, Kubecost for per-team attribution and anomaly detection. Custom Slack cost bot for real-time alerts, weekly team-level reports, and untagged-resource tracking

#project(
  name: "Observability & Incident Intelligence",
  role: "Observability",
)
- VictoriaMetrics over Thanos for simpler ops and better long-term retention. OTEL dual pipeline: metrics via Prometheus Remote Write, traces via Tempo. Robusta for AI-powered alert enrichment. Every alert links to a runbook — contributing to zero major incidents in 2+ years

#project(
  name: "Security & Compliance Engineering",
  role: "Security",
)
- Led SOC 2 Type II and ISO 27001 audits with zero critical findings. SOPS for encrypted secrets in git, container image signing (cosign/Sigstore), SBOM via Trivy, Nitro Enclaves for custody-adjacent confidential computing. MiCA-ready ahead of the July 2026 EU deadline

== Skills

- *Cloud & Compute*: EKS, RDS Aurora, Transit Gateway, Graviton/ARM, AWS Shield/WAF
- *Infrastructure as Software*: Pulumi, Terraform, AWS CDK, Drift Detection
- *Kubernetes Platform*: Karpenter, ArgoCD, Istio, Velero, Kyverno, CloudNativePG, Pod Identity, Stakater Reloader
- *Observability & FinOps*: VictoriaMetrics, Loki, Tempo, OpenTelemetry, Robusta, Kubecost
- *Security & Identity*: Trivy, cosign/Sigstore, Prowler, Nitro Enclaves, Dex/OIDC Federation, OAuth2 Proxy
- *Networking & Messaging*: Traefik, Headscale VPN, NATS, RabbitMQ
- *Data & Storage*: PostgreSQL, CloudNativePG, Barman/PITR, PgBouncer, Elasticsearch
- *CI/CD*: GitLab CI, Dynamic Pipeline Generation
- *Crypto & Fintech Domain*: OTC Desks, Market-Making, Arbitrage Systems, AML/KYC Compliance, MiCA
- *AI & Languages*: Claude API · Python · Go · Bash

== Certifications

#certificates(
  name: "Certified Kubernetes Administrator (CKA)",
  issuer: "CNCF — Cloud Native Computing Foundation",
  date: "2023",
)
