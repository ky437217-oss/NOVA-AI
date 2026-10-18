# NOVA AI — Build, Test and Publication Status

Date: 2026-10-17

## Source and licensing audit

- Base: OpenMausBot source archive, upstream version `0.1.114`.
- Original source archive: not modified.
- Public derivative: separate working copy with NOVA AI branding and black/cyan/purple skin.
- Retained upstream Apache-2.0 `LICENSE`, `NOTICE`, and third-party license/provenance material.
- Excluded upstream `enterprise/` source because its separate license prohibits redistribution; updated licensing notes and removed its CLA-only guide.
- Removed upstream enterprise Docker workflow and replaced upstream CI with a derivative-specific OSS workflow.
- `PUBLISH-TO-GITHUB.ps1` is included and guarded: it checks Git/GitHub CLI authentication, refuses an existing local `.git` or existing remote repository, and requires typing `PUBLISH` before creating/pushing a public repo.

## Checks run here

- Source ZIP integrity: **PASS** (input archive extracted without CRC errors).
- NOVA skin contrast checker: **PASS**; 52 NOVA skin pairs meet configured thresholds.
- Strict JSON parse: **PASS** for JSON files. `tsconfig.server.json` is JSONC (contains comments) and is intentionally excluded from strict JSON parsing.
- Enterprise source exclusion: **PASS** (`enterprise/` absent from public derivative).
- Publication script, license text, README, and workflow: reviewed statically; script has **not** been executed.

## Checks not completed

- TypeScript typecheck, lint, production build, Vitest suite, and Windows Electron installer: **NOT RUN**.
- `node scripts/check-electron.mjs`: **BLOCKED** because dependencies are not installed (`electron` module missing).
- Environment Node.js is `v22.16.0`; project requires Node.js `>=24` and `pnpm@10.33.0`. `pnpm` is unavailable in this execution environment, so dependency installation and supported build commands were not run.
- The public CI workflow checks typecheck, lint, contrast, Electron source checks, and production UI build. It does not yet run the full upstream test suite because several hosted/enterprise integration tests reference the intentionally excluded `enterprise/` source. Those tests need OSS-fork qualification before a full-suite pass can be claimed.

## GitHub publication status

- Target: `https://github.com/ky437217-oss/NOVA-AI`.
- **NOT PUBLISHED** from this environment. The available GitHub connection can inspect repositories but has no create-repository action. No remote repository was created and no code was pushed.
- To publish, extract the project folder on Windows, review the files, install/authenticate GitHub CLI (`gh auth login`), open PowerShell in the `NOVA-AI` folder, and run `./PUBLISH-TO-GITHUB.ps1`. It asks for the literal confirmation `PUBLISH` before creating a public repository and pushing.

Do not treat this report as a passing production build or a completed publication.
