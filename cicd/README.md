# CI/CD Fundamentals

Continuous Integration (CI) automatically checks changes. Continuous Delivery or Deployment (CD) automates preparing or releasing validated software.

This repository uses GitHub Actions to run lightweight checks on pushes and pull requests to `main`.

## Pipeline stages
1. Check out the repository.
2. Install ShellCheck.
3. Lint Bash scripts.
4. Validate shell syntax with `bash -n`.

Workflow definition: `.github/workflows/ci.yml`.

A green workflow means the configured checks passed; it does not replace testing in a real target environment.