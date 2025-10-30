### What this repository is

This repo builds a single AdGuardHome-compatible DNS blocklist by combining many upstream lists using AdGuard's HostlistCompiler. The compiled output is the plain text file named `blocklist` (root). Key artifacts and automation:

- `hostlist-compiler-config.json` — configuration of all source lists and transformations. Use this to adjust which sources are included and their transformations.
- `compile-hostlist` — small bash helper script that runs `hostlist-compiler` and performs light post-processing (remove blank lines, optional whitelist removal). This is the local entry-point for building the `blocklist` file.
- `.github/workflows/CompileList.yml` — workflow that runs the compilation daily (and on manual dispatch) inside the devcontainer, uploads the artifact and copies it to an S3 bucket.
- `.devcontainer/devcontainer.json` and `Dockerfile` — prescribed developer environment that installs Node/npm and globally installs `@adguard/hostlist-compiler` so the `hostlist-compiler` CLI is available.
- `Infrastructure/` — Terraform config that creates a private S3 bucket and CloudFront distribution used to host the compiled list.

### Quick developer tasks and exact commands

- Compile locally (assumes `@adguard/hostlist-compiler` is installed):

  ./compile-hostlist

- If you need to install the compiler locally (npm):

  npm i -g @adguard/hostlist-compiler@v1.0.39

- Devcontainer: the repo defines a devcontainer that already runs the `npm i -g` command as a post-create step. Open the repo in a Codespace or VS Code devcontainer to reproduce CI environment.

- CI run: GitHub Actions runs `./compile-hostlist` inside the devcontainer (see `.github/workflows/CompileList.yml`). The job uploads `blocklist` and a downstream job syncs it to S3 using `aws s3 cp ./blocklist s3://${{ vars.AWS_BUCKET_NAME }}`.

### Project-specific conventions and gotchas

- This project produces a DNS-style blocklist intended for AdGuardHome only; Pi-hole compatibility is explicitly not supported. Expect AdGuard-style adblock rules (see `hostlist-compiler-config.json` type: `adblock`).
- Some sources contain non-DNS rules or long rules. The repo historically commented out a sed line to remove very long lines (`sed -i '/^.{1024}./d' blocklist`) — keep that in mind if you see non-DNS entries.
- The compile script comments show a workaround for OISD (some upstream sources may require manual fetch into `oisd.txt` because HostlistCompiler can't fetch them reliably). See the comment in `compile-hostlist` and the linked HostlistCompiler issue.
- The CI uses a devcontainer image that includes Terraform; Terraform is used only for infra in `Infrastructure/` (S3 + CloudFront). Terraform variables (like bucket name) are external to the repo and not committed.

### Files to edit when changing behavior

- To change which upstream lists are included or how they are transformed, edit `hostlist-compiler-config.json`.
- To change post-processing rules (whitelist removal, trimming, filtering), edit `compile-hostlist`.
- To change CI scheduling, artifact handling, or S3 deployment, edit `.github/workflows/CompileList.yml`.
- To change hosting infra (bucket name, encryption, CloudFront), edit files under `Infrastructure/` and run Terraform externally.

### Useful examples from this repo

- Removing blank lines after compilation (actual command in `compile-hostlist`):

  sed -i '/^$/d' blocklist

- CI sync to S3 (from workflow):

  aws s3 cp ./blocklist s3://${{ vars.AWS_BUCKET_NAME }}

### Failure modes and where to look

- If compilation fails: check that `@adguard/hostlist-compiler` is installed and on PATH. In the devcontainer this is installed globally via npm per `.devcontainer/devcontainer.json` and `Dockerfile`.
- If an upstream source fails to download: check `hostlist-compiler-config.json` and try fetching the URL manually (some sources may block automated requests). For the OISD list, the project suggests downloading `https://big.oisd.nl/` to `oisd.txt` and including it locally.
- If CI can't upload to S3: ensure repository `vars.AWS_BUCKET_NAME` is set and secrets `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` exist.

### Small examples of what to change in PRs

- If adding a new source, add a new entry to `hostlist-compiler-config.json` following existing entries (include `type`, `source`, and `transformations`). Keep transformations aligned with other `adblock` sources (RemoveComments, Compress, Validate).
- If you need to filter out specific rule shapes post-compile, add a commented `sed` line in `compile-hostlist` with justification and tests (manual sample outputs).

If any of this is unclear or you want me to add examples for editing `hostlist-compiler-config.json` or a template PR checklist for changing sources, tell me which section to expand.
