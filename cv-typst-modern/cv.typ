#import "@preview/modern-cv:0.10.0": *

#show: resume.with(
  author: (
    firstname: "Valeriy",
    lastname: "Grachev",
    email: "spelendora@gmail.com",
    homepage: "https://spelendora.com/devops",
    linkedin: "spelendora",
    telegram: "spelendora",
    address: "Bangkok, Thailand (Remote)",
    positions: (
      "Platform Engineering Lead",
      "Regulated Crypto Trading Infrastructure",
    ),
  ),
  profile-picture: none,
  date: datetime.today().display(),
  language: "en",
  colored-headers: true,
  show-footer: false,
  show-address-icon: true,
  paper-size: "a4",
)

= Summary

Platform Engineering Lead for FinchTrade / Finery Markets (CNBC Top 300 Fintech) — a Swiss OTC desk and regulated crypto ECN. Own infrastructure, security, compliance (SOC 2 Type II, ISO 27001, MiCA), and the internal developer platform across 5 AWS regions. Direct report to CEO. *USD 170B+ annual trading volume*, *50% cloud cost reduction*, and *zero major incidents in 2+ years* across 24/7 markets with no maintenance windows.

= Experience

#resume-entry(
  title: "Platform Engineering Lead",
  location: "Bangkok · Remote",
  date: "Nov 2021 — Present",
  description: "FinchTrade / Finery Markets",
)

#resume-item[
  - Own the entire platform engineering function for a Swiss OTC desk and regulated crypto ECN (CNBC Top 300 Fintech). Report to CEO; lead infrastructure, security, compliance, and developer platform serving 15+ engineers across trading, market-making, and arbitrage teams
  - Architected multi-region AWS platform (5 regions, active-active) with domain-isolated EKS clusters enforcing blast-radius boundaries between trading core, OTC, and compliance workloads — 400+ pods, 50+ microservices, 24/7 markets with no maintenance windows
  - Built internal developer platform reducing service onboarding from days to minutes: developers write a 15-line `deploy.yaml` and get complete CI/CD with IRSA, secrets management, and database provisioning for 145+ repos. Evaluated Backstage; built purpose-fit tooling (FastAPI + React) due to crypto regulatory constraints
  - Achieved *50% cloud cost reduction*: Karpenter with Graviton/ARM spot instances, Kubecost for per-team spend attribution, and a custom Slack cost bot for real-time anomaly alerts
  - Led organization through SOC 2 Type II and ISO 27001 audits with zero critical findings. MiCA readiness for EU crypto regulation. Nitro Enclaves for custody-adjacent confidential computing, image signing (cosign/Sigstore), Kyverno blocking non-compliant deployments
]

#resume-entry(
  title: "Volunteer DevOps Lead (Part-Time)",
  location: "Remote",
  date: "Feb 2022 — Aug 2023",
  description: "helpingtoleave.org",
)

#resume-item[
  - Built and operated infrastructure for one of Ukraine's largest civilian evacuation organizations — *92K+ people assisted*, *16K+ fully guided evacuations* from frontline and occupied territories. Featured by Harvard Ukrainian Research Institute
  - Led team of 5 DevOps engineers and coordinated with 30+ tech specialists. Core platform: Telegram bot network serving 300+ volunteers coordinating real-time evacuations across active war zones
  - AWS / EKS / CDK infrastructure with full observability stack. Mitigated state-level DDoS attacks via AWS Shield and WAF to keep evacuation services online during active military operations
]

#resume-entry(
  title: "Co-Founder · Head of Product & Engineering",
  location: "Almaty, Kazakhstan",
  date: "Oct 2020 — Nov 2021",
  description: "AIDU (aidu.me)",
)

#resume-item[
  - Co-founded B2B marketplace connecting retail stores with service contractors in Kazakhstan. Built from zero to 30K+ customers and 1.3K+ active contractors across 254 service types
  - Owned all technical and product decisions: architecture, infrastructure (Kubernetes on GCP), hiring, delivery, and contractor payments. Led team of 10
  - Integrated with major retail chains: Alser, Mechta, Leroy Merlin, Sulpak, DNS, Technograd — enabling in-store service sales at checkout
]

#resume-entry(
  title: "Head of Product & Engineering (Contract)",
  location: "Remote",
  date: "Oct 2018 — Nov 2021",
  description: "EdTech Platform (IIDF Portfolio)",
)

#resume-item[
  - Built enterprise education platform for Russia's largest startup accelerator (IIDF — 400+ portfolio companies, 6B RUB fund). 30K+ students completed programs. Led team of 7
]

#resume-entry(
  title: "DevOps Engineer",
  location: "Moscow",
  date: "Oct 2018 — Oct 2020",
  description: "Fevlake.com",
)

#resume-item[
  - Built Kubernetes-based infrastructure from scratch for a DevOps consulting firm. Designed and executed monolith-to-microservices migration
]

#resume-entry(
  title: "Linux Administrator",
  location: "Moscow",
  date: "Nov 2017 — Sep 2018",
  description: "TCEH.com",
)

= Selected Projects

#resume-entry(
  title: "Multi-Region Fintech Platform",
  location: "Platform Architecture",
  date: "USD 170B+ annual · 5 regions",
  description: "FinchTrade / Finery Markets",
)

#resume-item[
  - Domain-isolated EKS clusters (trading core, OTC, market guard) enforcing hard blast-radius boundaries for crypto trading. Pulumi (Python) for unit-tested, type-safe infrastructure. Karpenter with Graviton/ARM and spot instances for sub-60s node provisioning during market volatility spikes
]

#resume-entry(
  title: "Internal Developer Platform (ft-toolbox)",
  location: "Platform Engineering",
  date: "FastAPI + React + Claude API",
  description: "FinchTrade / Finery Markets",
)

#resume-item[
  - Platform-as-a-Product approach: evaluated Backstage, built purpose-fit tooling due to crypto regulatory constraints. Claude API for AI-augmented operations — automated Jira digests, cost anomaly narration, Grafana audit that caught disabled SSL on 12/14 Postgres datasources
]

#resume-entry(
  title: "FinOps & Cost Engineering",
  location: "Cost Optimization",
  date: "50% reduction",
  description: "FinchTrade / Finery Markets",
)

#resume-item[
  - 50% cloud cost reduction across 5 AWS regions. Karpenter with Graviton/ARM and spot, Kubecost for per-team attribution and anomaly detection. Custom Slack cost bot for real-time alerts, weekly team-level reports, and untagged-resource tracking
]

#resume-entry(
  title: "Observability & Incident Intelligence",
  location: "Observability",
  date: "0 major incidents 2+ yrs",
  description: "FinchTrade / Finery Markets",
)

#resume-item[
  - VictoriaMetrics over Thanos for simpler ops and better long-term retention. OTEL dual pipeline: metrics via Prometheus Remote Write, traces via Tempo. Robusta for AI-powered alert enrichment. Every alert links to a runbook
]

#resume-entry(
  title: "Security & Compliance Engineering",
  location: "Security",
  date: "SOC 2 · ISO 27001 · MiCA",
  description: "FinchTrade / Finery Markets",
)

#resume-item[
  - Led SOC 2 Type II and ISO 27001 audits with zero critical findings. SOPS for encrypted secrets in git, container image signing (cosign/Sigstore), SBOM via Trivy, Nitro Enclaves for custody-adjacent confidential computing. MiCA-ready ahead of the July 2026 EU deadline
]

= Skills

#resume-skill-item(
  "Cloud & Compute",
  (strong("EKS"), "RDS Aurora", "Transit Gateway", "Graviton/ARM", "AWS Shield/WAF"),
)
#resume-skill-item(
  "Infrastructure as Software",
  (strong("Pulumi"), "Terraform", "AWS CDK", "Drift Detection"),
)
#resume-skill-item(
  "Kubernetes Platform",
  (strong("Karpenter"), "ArgoCD", "Istio", "Velero", "Kyverno", "CloudNativePG", "Pod Identity", "Stakater Reloader"),
)
#resume-skill-item(
  "Observability & FinOps",
  (strong("VictoriaMetrics"), "Loki", "Tempo", "OpenTelemetry", "Robusta", "Kubecost"),
)
#resume-skill-item(
  "Security & Identity",
  (strong("Trivy"), "cosign/Sigstore", "Prowler", "Nitro Enclaves", "Dex/OIDC Federation", "OAuth2 Proxy"),
)
#resume-skill-item(
  "Networking & Messaging",
  ("Traefik", "Headscale VPN", "NATS", "RabbitMQ"),
)
#resume-skill-item(
  "Data & Storage",
  (strong("PostgreSQL"), "CloudNativePG", "Barman/PITR", "PgBouncer", "Elasticsearch"),
)
#resume-skill-item(
  "CI/CD",
  ("GitLab CI", "Dynamic Pipeline Generation"),
)
#resume-skill-item(
  "Crypto & Fintech Domain",
  ("OTC Desks", "Market-Making", "Arbitrage Systems", "AML/KYC Compliance", "MiCA"),
)
#resume-skill-item(
  "Languages & AI",
  (strong("Python"), "Go", "Bash", "Claude API"),
)
#block(below: 0.65em)

= Certifications

#resume-entry(
  title: "Certified Kubernetes Administrator (CKA)",
  location: "CNCF — Cloud Native Computing Foundation",
  date: "2023",
)
