#!/usr/bin/env python3
"""Generate a 1-1.5 page CV PDF in 'Quiet Authority' style.

Data is sourced from devops/index.html (the live CV page), not cv-data.json.
Layout: narrow left rail (identity, metrics, core stack) + wide right column
(positioning, experience, projects, certs). Monochrome with a single teal
accent. Different from all 5 styles in generate-cv-pdf.py.

Usage:
    uv run --with weasyprint python3 build-cv-quiet.py
"""

from pathlib import Path
from weasyprint import HTML

OUTPUT = Path(__file__).parent / "cv-pdf" / "cv-quiet-authority.pdf"
OUTPUT.parent.mkdir(exist_ok=True)


HTML_DOC = """<!DOCTYPE html>
<html><head><meta charset="utf-8">
<style>
@import url('https://fonts.googleapis.com/css2?family=EB+Garamond:wght@400;500;600&family=Inter:wght@300;400;500;600&display=swap');

@page {
    size: A4;
    margin: 1.0cm 1.2cm;
    @bottom-center { content: counter(page) " / " counter(pages); font-family: 'Inter', sans-serif; font-size: 6pt; color: #9aa0a6; letter-spacing: 0.2em; }
}

* { margin: 0; padding: 0; box-sizing: border-box; }
html, body { background: #ffffff; }
body { font-family: 'Inter', sans-serif; font-size: 7.2pt; color: #1c1f23; line-height: 1.35; -webkit-font-smoothing: antialiased; }

/* accent: deep teal */
:root { --accent: #0d4f4a; }

/* ---------- TOP MASTHEAD ---------- */
.masthead { display: flex; align-items: flex-end; justify-content: space-between; padding-bottom: 5pt; border-bottom: 0.6pt solid #1c1f23; margin-bottom: 8pt; }
.masthead__left { display: flex; align-items: flex-end; gap: 9pt; }
.monogram { font-family: 'EB Garamond', serif; font-size: 20pt; font-weight: 500; line-height: 1; letter-spacing: -0.02em; color: #0d4f4a; border: 0.6pt solid #0d4f4a; padding: 4pt 7pt 3pt; }
.titleblock h1 { font-family: 'EB Garamond', serif; font-size: 19pt; font-weight: 500; letter-spacing: -0.01em; line-height: 1; color: #1c1f23; }
.titleblock p { font-size: 6.4pt; font-weight: 500; letter-spacing: 0.26em; text-transform: uppercase; color: #0d4f4a; margin-top: 3pt; }
.masthead__right { text-align: right; font-size: 6.5pt; color: #4a5158; line-height: 1.55; }
.masthead__right a { color: #0d4f4a; text-decoration: none; font-weight: 500; }
.masthead__right .label { color: #9aa0a6; letter-spacing: 0.18em; text-transform: uppercase; font-size: 6pt; margin-right: 4pt; }

/* ---------- TWO-COLUMN BODY ---------- */
.body { display: flex; gap: 14pt; }
.rail { width: 138pt; flex-shrink: 0; }
.main { flex: 1; min-width: 0; }

/* ---------- RAIL ---------- */
.rail-section { margin-bottom: 8pt; }
.rail-title { font-size: 5.8pt; font-weight: 600; letter-spacing: 0.26em; text-transform: uppercase; color: #1c1f23; padding-bottom: 2pt; border-bottom: 0.4pt solid #d8dadd; margin-bottom: 4pt; }

.metric-row { display: flex; align-items: baseline; justify-content: space-between; margin-bottom: 3pt; }
.metric-row:last-child { margin-bottom: 0; }
.metric-row__value { font-family: 'EB Garamond', serif; font-size: 11pt; font-weight: 500; color: #0d4f4a; line-height: 1; }
.metric-row__label { font-size: 6pt; color: #4a5158; text-align: right; max-width: 90pt; line-height: 1.25; letter-spacing: 0.02em; }

.stack-line { font-size: 6.3pt; color: #2a2f35; line-height: 1.4; margin-bottom: 2.5pt; }
.stack-line strong { display: block; font-size: 5.6pt; font-weight: 600; letter-spacing: 0.16em; text-transform: uppercase; color: #4a5158; margin-bottom: 0.5pt; }

.lang-row { display: flex; justify-content: space-between; font-size: 7pt; padding: 1.5pt 0; }
.lang-row__name { color: #1c1f23; }
.lang-row__level { color: #9aa0a6; font-size: 6.5pt; letter-spacing: 0.05em; }

/* ---------- MAIN ---------- */
.lede { font-family: 'EB Garamond', serif; font-size: 9.5pt; line-height: 1.4; color: #1c1f23; margin-bottom: 9pt; padding-left: 8pt; border-left: 1.2pt solid #0d4f4a; }
.lede em { font-style: italic; color: #0d4f4a; }

.section { margin-bottom: 8pt; }
.section-head { display: flex; align-items: baseline; justify-content: space-between; margin-bottom: 5pt; padding-bottom: 2pt; border-bottom: 0.4pt solid #d8dadd; }
.section-head__title { font-size: 6pt; font-weight: 600; letter-spacing: 0.28em; text-transform: uppercase; color: #1c1f23; }
.section-head__meta { font-size: 5.8pt; color: #9aa0a6; letter-spacing: 0.12em; text-transform: uppercase; }

/* --- Experience --- */
.exp { margin-bottom: 6pt; }
.exp__head { display: grid; grid-template-columns: 12pt 1fr auto; gap: 6pt; align-items: baseline; }
.exp__num { font-family: 'EB Garamond', serif; font-size: 8pt; font-weight: 500; color: #9aa0a6; letter-spacing: 0.05em; }
.exp__company { font-family: 'EB Garamond', serif; font-size: 10pt; font-weight: 500; color: #1c1f23; line-height: 1.15; }
.exp__role { font-size: 6.2pt; font-weight: 500; letter-spacing: 0.1em; text-transform: uppercase; color: #0d4f4a; margin-top: 0.5pt; }
.exp__date { font-size: 6.4pt; color: #4a5158; white-space: nowrap; font-variant-numeric: tabular-nums; }
.exp__bullets { margin: 2pt 0 0 18pt; padding: 0; list-style: none; }
.exp__bullets li { font-size: 6.7pt; color: #2a2f35; line-height: 1.35; margin-bottom: 1pt; padding-left: 7pt; position: relative; }
.exp__bullets li::before { content: ""; position: absolute; left: 0; top: 3.5pt; width: 4pt; height: 0.5pt; background: #0d4f4a; }

/* compact tail roles */
.exp-mini { display: grid; grid-template-columns: 12pt 1fr auto; gap: 6pt; align-items: baseline; padding: 2pt 0; border-top: 0.3pt solid #ebeced; }
.exp-mini:first-of-type { border-top: none; padding-top: 0; }
.exp-mini__num { font-family: 'EB Garamond', serif; font-size: 7pt; color: #9aa0a6; }
.exp-mini__company { font-size: 7pt; font-weight: 500; color: #1c1f23; }
.exp-mini__role { font-size: 6.4pt; color: #4a5158; margin-left: 2pt; }
.exp-mini__date { font-size: 6.2pt; color: #9aa0a6; white-space: nowrap; font-variant-numeric: tabular-nums; }
.exp-mini__desc { font-size: 6.4pt; color: #4a5158; margin-top: 0.5pt; line-height: 1.3; }

/* --- Projects --- */
.proj-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 4pt 10pt; }
.proj { padding-top: 3pt; border-top: 0.4pt solid #d8dadd; }
.proj__top { display: flex; align-items: baseline; gap: 4pt; margin-bottom: 1pt; }
.proj__num { font-family: 'EB Garamond', serif; font-size: 7pt; color: #0d4f4a; font-weight: 500; }
.proj__tag { font-size: 5.2pt; letter-spacing: 0.16em; text-transform: uppercase; color: #9aa0a6; }
.proj__name { font-family: 'EB Garamond', serif; font-size: 8.5pt; font-weight: 500; color: #1c1f23; line-height: 1.15; margin-bottom: 1pt; }
.proj__desc { font-size: 6.1pt; color: #4a5158; line-height: 1.32; }
.proj__metrics { font-size: 5.6pt; color: #0d4f4a; margin-top: 1.5pt; font-weight: 500; letter-spacing: 0.04em; }
</style></head>
<body>

<!-- ============== MASTHEAD ============== -->
<div class="masthead">
  <div class="masthead__left">
    <div class="monogram">VG</div>
    <div class="titleblock">
      <h1>Valeriy Grachev</h1>
      <p>Platform Engineering Lead &middot; Bangkok &middot; Remote</p>
    </div>
  </div>
  <div class="masthead__right">
    <div><span class="label">TG</span><a href="https://t.me/spelendora">@spelendora</a></div>
    <div><span class="label">EM</span>spelendora@gmail.com</div>
    <div><span class="label">IN</span>linkedin.com/in/spelendora</div>
  </div>
</div>

<!-- ============== BODY ============== -->
<div class="body">

  <!-- ============== RAIL ============== -->
  <aside class="rail">

    <div class="rail-section">
      <p class="rail-title">Impact at a glance</p>
      <div class="metric-row"><span class="metric-row__value">$170B+</span><span class="metric-row__label">Annual trading volume</span></div>
      <div class="metric-row"><span class="metric-row__value">50%</span><span class="metric-row__label">Cloud cost reduction</span></div>
      <div class="metric-row"><span class="metric-row__value">0</span><span class="metric-row__label">Major incidents in 2+ years</span></div>
      <div class="metric-row"><span class="metric-row__value">24/7</span><span class="metric-row__label">Zero maintenance windows</span></div>
      <div class="metric-row"><span class="metric-row__value">4.1M+</span><span class="metric-row__label">Institutional trades H1 2025</span></div>
    </div>

    <div class="rail-section">
      <p class="rail-title">Core stack</p>
      <p class="stack-line"><strong>Cloud &amp; Compute</strong>EKS &middot; RDS Aurora &middot; Transit Gateway &middot; Graviton/ARM &middot; AWS Shield/WAF</p>
      <p class="stack-line"><strong>IaC</strong>Pulumi &middot; Terraform &middot; AWS CDK &middot; Drift Detection</p>
      <p class="stack-line"><strong>Kubernetes</strong>Karpenter &middot; ArgoCD &middot; Istio &middot; Velero &middot; Kyverno &middot; CloudNativePG &middot; Pod Identity</p>
      <p class="stack-line"><strong>Observability &amp; FinOps</strong>VictoriaMetrics &middot; Loki &middot; Tempo &middot; OpenTelemetry &middot; Robusta &middot; Kubecost</p>
      <p class="stack-line"><strong>Security &amp; Identity</strong>Trivy &middot; cosign/Sigstore &middot; Prowler &middot; Nitro Enclaves &middot; Dex/OIDC &middot; OAuth2 Proxy</p>
      <p class="stack-line"><strong>Networking &amp; Messaging</strong>Traefik &middot; Headscale VPN &middot; NATS &middot; RabbitMQ</p>
      <p class="stack-line"><strong>Data &amp; Storage</strong>PostgreSQL &middot; CloudNativePG &middot; Barman/PITR &middot; PgBouncer &middot; Elasticsearch</p>
      <p class="stack-line"><strong>CI/CD</strong>GitLab CI &middot; Dynamic Pipeline Generation</p>
      <p class="stack-line"><strong>Crypto &amp; Fintech</strong>OTC Desks &middot; Market-Making &middot; Arbitrage &middot; AML/KYC &middot; MiCA</p>
      <p class="stack-line"><strong>AI &amp; Languages</strong>Claude API &middot; Python &middot; Go &middot; Bash</p>
    </div>

    <div class="rail-section">
      <p class="rail-title">Certification</p>
      <p class="stack-line" style="margin-top: 2pt;"><strong>CKA &mdash; 2023</strong>Certified Kubernetes Administrator, CNCF</p>
    </div>

  </aside>

  <!-- ============== MAIN ============== -->
  <main class="main">

    <p class="lede">
      I build and lead the platform engineering function for a regulated crypto trading company &mdash; institutional OTC, market-making, and arbitrage systems processing <em>$170B+ annually</em> across the network. <em>Zero major incidents in 2+ years</em>, 50% cloud cost reduction through FinOps, and an internal developer platform that lets engineering teams ship independently.
    </p>

    <!-- ============== EXPERIENCE ============== -->
    <section class="section">
      <div class="section-head">
        <span class="section-head__title">Professional Experience</span>
        <span class="section-head__meta">6 positions &middot; 8+ years</span>
      </div>

      <div class="exp">
        <div class="exp__head">
          <span class="exp__num">I</span>
          <div>
            <h3 class="exp__company">FinchTrade / Finery Markets</h3>
            <p class="exp__role">Platform Engineering Lead</p>
          </div>
          <span class="exp__date">Nov 2021 &mdash; Present</span>
        </div>
        <ul class="exp__bullets">
          <li>Own the entire platform engineering function for FinchTrade and Finery Markets (CNBC Top 300 Fintech) &mdash; a Swiss OTC desk and regulated crypto ECN. Report to CEO; own infrastructure, security, compliance, and developer platform serving 15+ engineers across trading, market-making, and arbitrage teams</li>
          <li>Architected multi-region AWS platform (5 regions, active-active) with domain-isolated EKS clusters enforcing blast-radius boundaries between trading core, OTC, and compliance workloads. 400+ pods, 50+ microservices, zero major incidents in 2+ years across 24/7 markets</li>
          <li>Built internal developer platform: developers write a 15-line deploy.yaml and get complete CI/CD with IRSA, secrets management, and database provisioning for 145+ repos. Evaluated Backstage; built purpose-fit tooling (FastAPI + React) due to crypto regulatory constraints</li>
          <li>Achieved 50% cloud cost reduction: Karpenter with Graviton/ARM spot instances, Kubecost for per-team spend attribution, custom Slack cost bot for real-time anomaly alerts</li>
          <li>Led organization through SOC 2 Type II and ISO 27001 audits with zero critical findings. MiCA readiness for EU crypto regulation. Nitro Enclaves for custody-adjacent confidential computing, image signing (cosign/Sigstore), Kyverno blocking non-compliant deployments</li>
        </ul>
      </div>

      <div class="exp">
        <div class="exp__head">
          <span class="exp__num">II</span>
          <div>
            <h3 class="exp__company">helpingtoleave.org</h3>
            <p class="exp__role">Volunteer DevOps Lead (Part-Time)</p>
          </div>
          <span class="exp__date">Feb 2022 &mdash; Aug 2023</span>
        </div>
        <ul class="exp__bullets">
          <li>Built and operated infrastructure for one of Ukraine's largest civilian evacuation organizations &mdash; 92K+ people assisted, 16K+ fully guided evacuations from frontline and occupied territories. Featured by Harvard Ukrainian Research Institute</li>
          <li>Led team of 5 DevOps engineers; coordinated with 30+ tech specialists. Telegram bot network serving 300+ volunteers. Mitigated state-level DDoS attacks via AWS Shield/WAF to keep services online during active military operations</li>
        </ul>
      </div>

      <div class="exp">
        <div class="exp__head">
          <span class="exp__num">III</span>
          <div>
            <h3 class="exp__company">AIDU (aidu.me)</h3>
            <p class="exp__role">Co-Founder &middot; Head of Product &amp; Engineering</p>
          </div>
          <span class="exp__date">Oct 2020 &mdash; Nov 2021</span>
        </div>
        <ul class="exp__bullets">
          <li>Co-founded B2B marketplace connecting retail stores with service contractors in Kazakhstan. Built from zero to 30K+ customers, 1.3K+ active contractors across 254 service types. Led team of 10; owned architecture, infrastructure (Kubernetes on GCP), hiring, and contractor payments</li>
          <li>Integrated with major retail chains: Alser, Mechta, Leroy Merlin, Sulpak, DNS, Technograd &mdash; enabling in-store service sales at checkout</li>
        </ul>
      </div>

      <!-- Earlier roles compact -->
      <div style="margin-top: 6pt;">
        <div class="exp-mini">
          <span class="exp-mini__num">IV</span>
          <div>
            <span class="exp-mini__company">EdTech Platform (IIDF Portfolio)</span><span class="exp-mini__role"> &mdash; Head of Product &amp; Engineering (Contract)</span>
            <p class="exp-mini__desc" style="padding-left: 0;">Education platform for Russia's largest startup accelerator (400+ portfolio companies). 30K+ students. Team of 7</p>
          </div>
          <span class="exp-mini__date">Oct 2018 &mdash; Nov 2021</span>
        </div>
        <div class="exp-mini">
          <span class="exp-mini__num">V</span>
          <div>
            <span class="exp-mini__company">Fevlake.com</span><span class="exp-mini__role"> &mdash; DevOps Engineer</span>
            <p class="exp-mini__desc" style="padding-left: 0;">Kubernetes infrastructure from scratch. Monolith-to-microservices migration</p>
          </div>
          <span class="exp-mini__date">Oct 2018 &mdash; Oct 2020</span>
        </div>
        <div class="exp-mini">
          <span class="exp-mini__num">VI</span>
          <div>
            <span class="exp-mini__company">TCEH.com</span><span class="exp-mini__role"> &mdash; Linux Administrator</span>
          </div>
          <span class="exp-mini__date">Nov 2017 &mdash; Sep 2018</span>
        </div>
      </div>
    </section>

    <!-- ============== PROJECTS ============== -->
    <section class="section">
      <div class="section-head">
        <span class="section-head__title">Selected Projects</span>
        <span class="section-head__meta">FinchTrade / Finery Technologies</span>
      </div>

      <div class="proj-grid">
        <div class="proj">
          <div class="proj__top"><span class="proj__num">01</span><span class="proj__tag">Platform Architecture</span></div>
          <p class="proj__name">Multi-Region Fintech Platform</p>
          <p class="proj__desc">Domain-isolated EKS clusters (trading core, OTC, market guard) instead of namespaces &mdash; hard blast-radius boundaries. Pulumi (Python) for unit-tested, type-safe infrastructure. Karpenter with Graviton/ARM and spot for sub-60s node provisioning during volatility spikes.</p>
          <p class="proj__metrics">$170B+ volume &middot; 5 AWS regions &middot; Active-Active</p>
        </div>
        <div class="proj">
          <div class="proj__top"><span class="proj__num">02</span><span class="proj__tag">Platform Engineering</span></div>
          <p class="proj__name">Internal Developer Platform</p>
          <p class="proj__desc">ft-toolbox (FastAPI + React) with Claude API for AI-augmented operations &mdash; automated Jira digests, cost anomaly narration, Grafana audit that caught disabled SSL on 12/14 Postgres datasources. Golden paths for self-service.</p>
          <p class="proj__metrics">6+ tools &middot; Backstage evaluated &middot; Claude API</p>
        </div>
        <div class="proj">
          <div class="proj__top"><span class="proj__num">03</span><span class="proj__tag">FinOps</span></div>
          <p class="proj__name">FinOps &amp; Cost Engineering</p>
          <p class="proj__desc">50% cloud cost reduction across 5 AWS regions. Karpenter with Graviton/ARM and spot, Kubecost for per-team attribution and anomaly detection. Custom Slack bot &mdash; real-time spend alerts, weekly team reports, untagged-resource tracking.</p>
          <p class="proj__metrics">50% reduction &middot; Per-team attribution</p>
        </div>
        <div class="proj">
          <div class="proj__top"><span class="proj__num">04</span><span class="proj__tag">Observability</span></div>
          <p class="proj__name">Observability &amp; Incident Intelligence</p>
          <p class="proj__desc">VictoriaMetrics over Thanos &mdash; simpler ops, better compression. OTEL dual pipeline: metrics via Prometheus Remote Write, traces via Tempo. Robusta for AI-powered alert enrichment. Every alert links to a runbook.</p>
          <p class="proj__metrics">0 incidents &middot; AI alert enrichment</p>
        </div>
        <div class="proj">
          <div class="proj__top"><span class="proj__num">05</span><span class="proj__tag">Service Mesh</span></div>
          <p class="proj__name">Istio Service Mesh</p>
          <p class="proj__desc">Istio over Linkerd &mdash; more expressive AuthorizationPolicy for crypto compliance rules ("only compliance service calls KYT"). Validated with 17-service staging. Rolling out PERMISSIVE &rarr; STRICT mTLS per namespace.</p>
          <p class="proj__metrics">17-service demo &middot; STRICT mTLS rollout</p>
        </div>
        <div class="proj">
          <div class="proj__top"><span class="proj__num">06</span><span class="proj__tag">Security &amp; Compliance</span></div>
          <p class="proj__name">Security &amp; Compliance Engineering</p>
          <p class="proj__desc">Led SOC 2 Type II and ISO 27001 audits with zero critical findings. SOPS over Vault &mdash; encrypted secrets in git, auditable. cosign/Sigstore signing, SBOM via Trivy, Nitro Enclaves for confidential computing. MiCA-ready ahead of July 2026.</p>
          <p class="proj__metrics">SOC 2 Type II &middot; ISO 27001 &middot; MiCA Ready</p>
        </div>
      </div>
    </section>

  </main>
</div>

</body></html>
"""


def main() -> None:
    HTML(string=HTML_DOC).write_pdf(str(OUTPUT))
    print(f"Generated: {OUTPUT}")


if __name__ == "__main__":
    main()
