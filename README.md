# DevOps Learning Lab

A hands-on DevOps portfolio by **Ferry Hidayat**.

This repository documents a practical learning journey from Linux fundamentals to containerization, CI/CD, monitoring, and cloud-native workflows. Examples are designed to be reproducible, documented, and safe to run in a personal learning environment.

## Goals
- Build confidence with Linux administration and shell scripting.
- Practice Git and GitHub workflows.
- Package services with Docker and Docker Compose.
- Automate checks with GitHub Actions.
- Learn service delivery with Nginx.
- Introduce monitoring, logging, and operational documentation.

## Repository structure
```text
.
├── linux/                 # Linux notes and shell automation
├── docker/                # Container examples
├── cicd/                  # CI/CD concepts
├── monitoring/            # Monitoring and logging labs
├── docs/                  # Learning roadmap
└── .github/workflows/     # GitHub Actions pipelines
```

## Learning modules
| Module | Topics | Status |
|---|---|---|
| 01 | Linux fundamentals and Bash | In progress |
| 02 | Git and GitHub workflow | Planned |
| 03 | Docker and Docker Compose | Planned |
| 04 | CI/CD with GitHub Actions | Planned |
| 05 | Nginx and reverse proxy | Planned |
| 06 | Monitoring and logging | Planned |
| 07 | Cloud and Infrastructure as Code | Planned |

## Getting started
The examples target Ubuntu Linux. Use a disposable VM, WSL environment, or other non-production machine. Read each module's README before running scripts.

```bash
git clone https://github.com/VerryHdyt/devops-lab.git
cd devops-lab
```

Make scripts executable before running them:
```bash
chmod +x linux/scripts/*.sh
```

## Safety
- Scripts are intended for learning and inspection first.
- No script should require root privileges unless explicitly documented.
- Review destructive operations before execution.
- Never commit passwords, API keys, tokens, private keys, or personal credentials.

## Author
**Ferry Hidayat**  
GitHub: [@VerryHdyt](https://github.com/VerryHdyt)

---
This repository is a living lab. Content will be added as each topic is studied, tested, and documented.