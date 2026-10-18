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

## Public repository preparation
- Replaced the root README with NOVA AI-specific setup, upstream attribution, licensing scope, and build instructions.
- Added `OLLAMA-SETUP.md` describing the existing OpenAI-compatible chat-engine path to a local Ollama endpoint. This does not claim every agent driver uses Ollama.
- Updated root package homepage/repository metadata to the intended `ky437217-oss/NOVA-AI` repository.
- Removed release/CLA workflows that would mirror artifacts or signatures to the upstream maintainer's repositories. No upstream repository was modified.
- Added `PUBLISH-TO-GITHUB.ps1`, a guarded script that requires the user to type `PUBLISH` and stops if a local Git repo or target GitHub repository already exists. It has not been executed here.

## Public redistribution boundary
- Excluded the upstream `enterprise/` directory because its separate license prohibits redistribution. The public derivative contains the Apache-2.0 open-source edition and retained third-party notices only.
- Replaced upstream CI that expected enterprise source with a derivative-specific Node 24 / pnpm 10.33 workflow. CI has not yet run on GitHub because the new repository has not been created.
