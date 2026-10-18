# NOVA AI

**A rebranded, community-maintained derivative of [OpenMausBot](https://github.com/milind-soni/OpenMausBot)** — a local-first desktop app for working with a team of AI agents.

NOVA AI uses a futuristic black, electric-cyan and purple theme. The desktop app retains upstream functionality where compatible; it is not a clean-room rewrite and not every upstream workflow or integration has been independently revalidated.

> **Attribution and licensing:** This project is derived from OpenMausBot by Milind Soni and contributors. The upstream Apache-2.0 `LICENSE`, `NOTICE`, and third-party license notices are retained. The upstream `enterprise/` directory is intentionally excluded because its separate license prohibits redistribution. Read [`LICENSING.md`](LICENSING.md) and the applicable third-party notices before redistribution. The Apache license does not grant rights to upstream trademarks. NOVA AI is an independent derivative and is not affiliated with OpenMausBot's maintainers or any referenced model provider.

## Highlights

- Dark NOVA skin with electric-cyan highlights and purple chat bubbles.
- Windows Electron desktop packaging; other upstream platforms may require separate validation.
- Local-first harness architecture and approval cards for actions that require permission.
- Supports an OpenAI-compatible chat endpoint, which can be configured to use a local Ollama server.
- Original upstream license, notices and third-party attribution retained.

## Local Ollama setup (Windows)

1. Install and start [Ollama](https://ollama.com/), then pull a model in PowerShell, for example:

   ```powershell
   ollama pull llama3.2:3b
   ollama list
   ```

2. Confirm the local API is responding:

   ```powershell
   Invoke-RestMethod http://127.0.0.1:11434/api/tags
   ```

3. Open NOVA AI and go to **Settings → Connections → Model providers**.
4. Set **OpenAI-compatible base URL** to `http://127.0.0.1:11434/v1`.
5. If the key field is mandatory, enter a non-secret placeholder such as `ollama` (Ollama's local OpenAI-compatible endpoint does not require a cloud API key). Do not paste any real secret into screenshots or logs.
6. Press **Test**, then choose **OpenAI-compatible (OpenRouter / Groq)** in a bot's model picker and select the model name returned by your Ollama installation, e.g. `llama3.2:3b`.

This configures the built-in OpenAI-compatible **chat engine**. It does not automatically replace the model or authentication of separate Claude/Codex/other CLI agent drivers. Ollama must be running locally; `127.0.0.1` is intentionally used instead of exposing the API to the network.

If the model is not listed, check `ollama list`, verify the base URL includes `/v1`, and confirm the app and Ollama run on the same computer.

## Development prerequisites

- Node.js **24 or newer**
- pnpm **10.33.0** (the repository's declared package manager)
- Git
- For the Windows desktop installer: Windows build tools and the native dependencies required by Electron Builder and the included helper preparation scripts

Install and run the checks from PowerShell or a compatible terminal:

```powershell
corepack enable
corepack prepare pnpm@10.33.0 --activate
pnpm install --frozen-lockfile
pnpm typecheck
pnpm lint
pnpm check:contrast
pnpm check:electron
pnpm build
# Full test-suite status is documented in NOVA-AI-BUILD-TEST-RESULTS.md
```

Run the desktop development build with:

```powershell
pnpm dev:desktop
```

Build a Windows installer only after the checks pass:

```powershell
pnpm package:win
```

Build commands may download platform-specific helper binaries. Review the relevant preparation scripts and license notices before distributing artifacts.

## Publish this fork to GitHub

The source archive includes [`PUBLISH-TO-GITHUB.ps1`](PUBLISH-TO-GITHUB.ps1), a guarded helper that can create `ky437217-oss/NOVA-AI` as a public repository and push this checkout using your own authenticated GitHub CLI. Review the script first, install the GitHub CLI if needed, and run it only when you're ready to make the repository public. It refuses to overwrite an existing Git remote/repository.

## Project history

- Upstream: [milind-soni/OpenMausBot](https://github.com/milind-soni/OpenMausBot)
- Rebranding and packaging notes: [`NOVA-AI-CHANGES.md`](NOVA-AI-CHANGES.md)
- Build/test report: [`NOVA-AI-BUILD-TEST-RESULTS.md`](NOVA-AI-BUILD-TEST-RESULTS.md)
- Local Ollama notes: [`OLLAMA-SETUP.md`](OLLAMA-SETUP.md)

NOVA AI is not an official OpenMausBot release. Report issues against this derivative, and verify the source and license of every third-party component before redistribution.
