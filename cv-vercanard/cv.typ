#import "@preview/vercanard:1.0.3": *

#show: resume.with(
  name: "Valeriy Grachev",
  title: "Platform Engineering Lead",
  // Deep teal — matches existing CV accent (#0d4f4a)
  accent-color: rgb("#0d4f4a"),
  margin: 1.5cm,
  aside: [
    = Contact

    - Bangkok / Remote
    - #link("mailto:spelendora@gmail.com")[spelendora\@gmail.com]
    - #link("https://linkedin.com/in/spelendora")[linkedin/spelendora]
    - #link("https://spelendora.com/devops")[spelendora.com/devops]
    - #link("https://t.me/spelendora")[t.me/spelendora]

    = Impact

    - USD 170B+ trading volume / yr
    - 50% cloud cost reduction
    - Zero major incidents, 2+ yrs
    - 5 AWS regions, active-active
    - 145+ repos on platform

    = Cloud & K8s

    - AWS: EKS, Aurora, TGW, Shield/WAF
    - Karpenter, Graviton/ARM, spot
    - ArgoCD, Istio, Velero, Kyverno
    - CloudNativePG, Pod Identity

    = IaC & CI/CD

    - Pulumi (Python), Terraform, CDK
    - GitLab CI, dynamic pipelines
    - Drift detection, image signing

    = Observability & FinOps

    - VictoriaMetrics, Loki, Tempo
    - OpenTelemetry, Robusta
    - Kubecost, Slack cost bot

    = Security & Compliance

    - SOC 2 Type II, ISO 27001, MiCA
    - cosign/Sigstore, Trivy, Prowler
    - Nitro Enclaves, SOPS
    - Dex/OIDC, OAuth2 Proxy

    = Data, Net, AI

    - Postgres, Barman/PITR, PgBouncer
    - NATS, RabbitMQ, Elasticsearch
    - Traefik, Headscale VPN
    - Claude API, Python, Go, Bash

    = Domain

    - OTC desks, market-making
    - Arbitrage, AML/KYC, MiCA

    = Certifications

    - CKA — CNCF (2023)
  ],
)

= Summary

Platform Engineering Lead for #link("https://finchtrade.com")[FinchTrade] / #link("https://finerymarkets.com")[Finery Markets] (CNBC Top 300 Fintech) — a Swiss OTC desk and regulated crypto ECN. I own infrastructure, security, compliance (SOC 2 Type II, ISO 27001, MiCA), and the internal developer platform across 5 AWS regions. Direct report to CEO. USD 170B+ annual trading volume, 50% cloud cost reduction, zero major incidents in 2+ years across 24/7 markets.

= Experience

#entry[Platform Engineering Lead][
  Own the entire platform engineering function for a Swiss OTC desk and regulated crypto ECN. Report to CEO; lead infrastructure, security, compliance, and developer platform serving 15+ engineers across trading, market-making, and arbitrage teams.

  Architected multi-region AWS platform (5 regions, active-active) with domain-isolated EKS clusters enforcing blast-radius boundaries between trading core, OTC, and compliance — 400+ pods, 50+ microservices, 24/7 markets with no maintenance windows.

  Built internal developer platform that cut service onboarding from days to minutes: developers write a 15-line `deploy.yaml` and get full CI/CD with IRSA, secrets, and database provisioning across 145+ repos. Evaluated Backstage; built purpose-fit FastAPI + React tooling due to crypto regulatory constraints.

  Achieved 50% cloud cost reduction via Karpenter with Graviton/ARM spot, Kubecost for per-team attribution, and a custom Slack cost bot. Led organization through SOC 2 Type II and ISO 27001 audits with zero critical findings; MiCA-ready ahead of the July 2026 EU deadline. Nitro Enclaves, image signing (cosign/Sigstore), Kyverno admission control.
][FinchTrade / Finery Markets — Bangkok / Remote — Nov 2021 → Present]

#entry[Volunteer DevOps Lead (Part-Time)][
  Built and operated infrastructure for one of Ukraine's largest civilian evacuation organizations: 92K+ people assisted, 16K+ fully guided evacuations from frontline and occupied territories. Featured by Harvard Ukrainian Research Institute. Led 5 DevOps engineers, coordinating with 30+ specialists. Telegram bot network served 300+ volunteers; AWS / EKS / CDK with full observability; mitigated state-level DDoS via AWS Shield and WAF.
][helpingtoleave.org — Remote — Feb 2022 → Aug 2023]

#entry[Co-Founder · Head of Product & Engineering][
  Co-founded a B2B marketplace connecting retail stores with service contractors in Kazakhstan: zero to 30K+ customers and 1.3K+ active contractors across 254 service types. Owned all technical and product decisions: architecture, infrastructure (Kubernetes on GCP), hiring, delivery, contractor payments. Led team of 10. Integrated with Alser, Mechta, Leroy Merlin, Sulpak, DNS, Technograd to enable in-store service sales at checkout.
][AIDU (aidu.me) — Almaty, Kazakhstan — Oct 2020 → Nov 2021]

#entry[Head of Product & Engineering (Contract)][
  Built enterprise education platform for Russia's largest startup accelerator (IIDF — 400+ portfolio companies, 6B RUB fund). 30K+ students completed programs through the platform. Led team of 7.
][EdTech Platform (IIDF Portfolio) — Remote — Oct 2018 → Nov 2021]

#entry[DevOps Engineer · Linux Administrator][
  Earlier roles: Built Kubernetes infrastructure from scratch and led monolith-to-microservices migration at Fevlake.com (DevOps consulting). Linux operations at TCEH.com.
][Fevlake.com / TCEH.com — Moscow — Nov 2017 → Oct 2020]

= Selected Projects

#entry[Multi-Region Fintech Platform — USD 170B+ / yr][
  Domain-isolated EKS clusters (trading core, OTC, market guard) enforcing hard blast-radius boundaries. Pulumi (Python) for unit-tested, type-safe infrastructure. Karpenter with Graviton/ARM and spot for sub-60s node provisioning during market volatility spikes.
][Platform Architecture · 5 AWS regions, active-active]

#entry[Internal Developer Platform (ft-toolbox)][
  Platform-as-a-Product. Evaluated Backstage; built purpose-fit FastAPI + React due to crypto regulatory constraints. Claude API for AI-augmented operations: automated Jira digests, cost-anomaly narration, Grafana audit that caught disabled SSL on 12/14 Postgres datasources.
][Platform Engineering · 145+ repos]

#entry[FinOps, Observability & Security][
  50% cloud cost reduction via Karpenter + Graviton/ARM spot, Kubecost, custom Slack cost bot. VictoriaMetrics + OTEL dual pipeline (Prometheus Remote Write, Tempo), Robusta alert enrichment — zero major incidents in 2+ years. SOC 2 Type II + ISO 27001, zero critical findings; SOPS, cosign/Sigstore, Nitro Enclaves; MiCA-ready.
][Cost · Observability · Security]
