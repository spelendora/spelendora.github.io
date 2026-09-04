#import "@preview/modern-cv:0.10.0": *

#show: resume.with(
  author: (
    firstname: "Valeriy",
    lastname: "Grachev",
    email: "spelendora@gmail.com",
    homepage: "https://spelendora.com",
    linkedin: "spelendora",
    address: "Remote",
    custom: (
      (text: "t.me/spelendora", icon: "telegram", link: "https://t.me/spelendora"),
    ),
    positions: (
      "Head of Platform Engineering",
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

Head of Platform Engineering for a Swiss OTC desk and regulated crypto ECN serving 150+ institutional participants in 40 countries. A two-person team I lead supports 30 engineers: *zero major outages in 2+ years* on 24/7 markets, *50% lower cloud spend*, DORA Elite delivery. Looking for a hands-on platform leadership role in crypto/fintech.

= Experience

#resume-entry(
  title: "Head of Platform Engineering",
  location: "Remote",
  date: "Nov 2021 — Present",
  description: "Finery Tech Holding (FinchTrade · Finery Markets)",
)

#resume-item[
  - Report to the CEO; own infrastructure, security, compliance, and the developer platform. The trading platform cleared 5.2M+ institutional trades in Q1 2026 alone, up 160% year over year
  - Hired the platform engineer, set the on-call rotation and SEV taxonomy, and run a quarterly roadmap with engineering leads, holding DORA Elite delivery with no added headcount
  - Architected a 5-region active-active AWS/EKS footprint of 800+ pods and 100+ microservices, carrying 24/7 crypto markets with no maintenance windows
  - Placed trading systems close to the venues they trade on, connected by an Istio mesh carrying mTLS, traffic management, and compliance rules like "only the compliance service may call KYT." All of it written in Pulumi (Python)
  - Codified incident response: a 15-min SEV1 SLA, per-component RTO/RPO, a runbook behind every alert. Act as incident commander, correlating telemetry and flow logs to attribute attacks and drive post-mortems
  - Built the internal developer platform: service onboarding went from days to minutes, because a developer writes one 15-line manifest and gets CI with Semgrep, Gitleaks, Trivy and dependency-audit gates, GitOps rollout via ArgoCD, and an ephemeral preview environment per branch
  - That pipeline handles about 5,400 CI jobs a day at a median under 8 minutes, carrying around 600 merge requests a month
  - Cut cloud spend *50%*: Karpenter consolidation, spot in non-prod, Kubecost (FOCUS-aligned) per-team attribution, plus a Slack bot that routes cost anomalies to the owning team with LLM-generated explanations
  - Owned the technical workstream for SOC 2 Type II and ISO 27001/27701 audits; both passed with no critical findings, and built the controls that made the platform MiCA-ready
  - Shipped an internal access-governance tool: multi-approver access requests on an append-only audit trail
]

#resume-entry(
  title: "Volunteer DevOps Lead (Part-time)",
  location: "Remote",
  date: "Feb 2022 — Aug 2023",
  description: "helpingtoleave.org",
)

#resume-item[
  - Built and ran infrastructure for one of Ukraine's largest civilian evacuation organizations: *92K+ people assisted*, 16K+ fully guided evacuations from frontline and occupied territories. Featured by the Harvard Ukrainian Research Institute
  - Led a team of 5 on AWS/EKS/CDK infrastructure behind a Telegram bot network serving 300+ volunteers. Mitigated state-level DDoS attacks with AWS Shield and WAF to keep evacuation services online during active military operations
]

#resume-entry(
  title: "Co-Founder · Head of Product & Engineering",
  location: "Remote",
  date: "Oct 2020 — Nov 2021",
  description: "AIDU (terminal.aidu.me)",
)

#resume-item[
  - Co-founded a B2B marketplace connecting retail stores with service contractors in Kazakhstan. Grew it from zero to 30K+ customers and 1.3K+ active contractors
  - Owned every technical and product decision (architecture, Kubernetes on GCP, hiring, delivery, contractor payments) and led a team of 10. Integrated with major retail chains (Alser, Mechta, Leroy Merlin, Sulpak, DNS), which enabled in-store service sales at checkout
]

#resume-entry(
  title: "Head of Product & Engineering (Part-time contract)",
  location: "Remote",
  date: "Oct 2018 — Nov 2021",
  description: "EdTech Platform (IIDF Portfolio)",
)

#resume-item[
  - Built the education platform for Russia's largest startup accelerator. Led a team of 7; 30K+ students completed programs
]

#resume-entry(
  title: "DevOps Engineer",
  location: "Remote",
  date: "Oct 2018 — Oct 2020",
  description: "Fevlake.com",
)

#resume-item[
  - Built Kubernetes infrastructure from scratch for a DevOps consulting firm and ran a monolith-to-microservices migration
]

= Skills

#resume-skill-item(
  "Crypto & fintech domain",
  (strong("OTC desks"), "Non-custodial ECN", "MPC custody (Fireblocks, Inabit)", "AML/KYC (Sumsub)"),
)
#resume-skill-item(
  "Compliance & GRC",
  (strong("SOC 2 Type II"), "ISO 27001/27701", "MiCA-ready", "DORA", "GDPR", "FINMA SRO (VQF)", "IAM access governance"),
)
#resume-skill-item(
  "Cloud & Kubernetes platform",
  (strong("EKS multi-region"), "Karpenter (spot, sub-60s provisioning)", "ArgoCD ApplicationSets", "Istio", "Kyverno", "Velero", "Transit Gateway", "Shield/WAF", "CloudFront"),
)
#resume-skill-item(
  "Infrastructure as code",
  (strong("Pulumi (Python)"), "Terraform", "AWS CDK", "Helm", "Kustomize"),
)
#resume-skill-item(
  "Data & messaging",
  (strong("PostgreSQL"), "CloudNativePG", "Aurora", "PgBouncer", "PITR backups", "NATS", "Redis"),
)
#resume-skill-item(
  "Observability & reliability",
  (strong("VictoriaMetrics"), "OpenTelemetry", "Loki", "Tempo", "Grafana", "Fluent Bit", box("Robusta"), "incident.io", "SLO/SLI & error budgets"),
)
#resume-skill-item(
  "Secrets & identity",
  (strong("External Secrets Operator"), "AWS Secrets Manager", "SOPS", "Dex/OIDC federation", "IRSA / Pod Identity"),
)
#resume-skill-item(
  "Security & CI/CD",
  (strong("Semgrep"), "Gitleaks", "Trivy", "GitLab CI", "Helm + ArgoCD GitOps"),
)
#resume-skill-item(
  "Programming & AI tooling",
  (strong("Python"), "Go", "Bash", "Claude API", "MCP servers"),
)
#block(below: 0.65em)

= Certifications

#resume-entry(
  title: "Certified Kubernetes Administrator (CKA)",
  location: "CNCF, 2023",
  date: "",
)
