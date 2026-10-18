# NOVA AI Rebranding Report

# NOVA AI — Change Log

This is a rebranded derivative copy of OpenMausBot. The original `/mnt/data/OpenMausBot-main.zip` was not modified.

## Branding and UI
- Changed the default app label to **NOVA AI** in the web title, default brand configuration, manifest, and selected desktop messages.
- Added a new **NOVA AI** skin: deep-black surfaces, electric cyan accents, and purple chat bubbles.
- Made NOVA the default skin for new installs; existing saved skin preferences continue to be respected by the existing local-storage logic.
- Added matching native desktop caption-bar colors for the new skin.
- Updated visible English locale string values to use NOVA AI branding while preserving translation keys.

## Packaging and compatibility
- Updated package metadata and Electron product/app IDs/artifact naming.
- Removed the inherited GitHub publish target from the Electron Builder config to avoid publishing/updating this fork through the upstream author's release repository.
- Kept original `LICENSE` and `NOTICE` files and retained repository attribution/source references.
- Kept the legacy `openmausbot` deep-link scheme and `.openmausbot` data paths to avoid breaking existing workflows; these internal compatibility identifiers are intentionally not renamed.

## Safety
- The upstream source archive was read only. All edits were applied while writing a separate ZIP.
- No credentials were added. No destructive runtime or OS actions were introduced.

---

# NOVA AI — Build and Test Results

## Environment
- Archive: `NOVA-AI-source.zip`
- Upstream source version: `0.1.114`
- Detected Node.js in execution environment: `v22.16.0`
- Project requires Node.js `>=24` and pnpm `10.33.0`.
- `pnpm` was not available in the execution environment.

## Checks run
- Original ZIP integrity: **PASS** (`ZipFile.testzip()` returned no corrupt member).
- Output ZIP integrity: **PASS** (`ZipFile.testzip()` returned no corrupt member after packaging).
- Strict JSON parse: **PASS** for all strict JSON files except `tsconfig.server.json`, which is TypeScript JSON-with-comments (JSONC); all 13 locale JSON files parse successfully.
- NOVA skin contrast checker (`node scripts/check-skin-contrast.mjs`): **PASS** for NOVA; all 52 measured pairs meet configured thresholds. Existing upstream Midnight contrast exceptions remain documented by the checker.
- TypeScript build / full Vitest suite / Electron packaging: **NOT RUN**. The available Node.js is v22.16.0, but this project requires Node.js 24+; pnpm is unavailable. A direct attempt to run the Electron skin test was blocked because `vitest` is not installed. Do not interpret this as a passing full build.

## Known verification items
- Run `pnpm install --frozen-lockfile`, `pnpm typecheck`, `pnpm lint`, `pnpm check:contrast`, and `pnpm test` with Node.js 24+ and pnpm 10.33.0.
- Review branding strings in non-English locales and any upstream-specific update/sign-in flows before distributing a public binary.
- Confirm that the `com.novaai.app` application ID is acceptable for the intended installation; it creates a distinct packaged app identity.
