# NOVA AI + Ollama (Windows)

This guide configures the built-in OpenAI-compatible chat engine to use Ollama on the same Windows PC. It does not reconfigure separate CLI agent engines.

## 1. Check Ollama

In PowerShell:

```powershell
ollama --version
ollama pull llama3.2:3b
ollama list
Invoke-RestMethod http://127.0.0.1:11434/api/tags
```

If the endpoint is unavailable, start Ollama normally and retry. Do not open port 11434 to the public internet.

## 2. Configure NOVA AI

In **Settings → Connections → Model providers**:

- **OpenAI-compatible base URL:** `http://127.0.0.1:11434/v1`
- **OpenAI-compatible API key:** `ollama` if the field is required; this is a placeholder, not a real credential.
- Select **Test**.

Then open a bot's model picker, choose **OpenAI-compatible (OpenRouter / Groq)** and select the exact model tag shown by `ollama list`, such as `llama3.2:3b`.

## 3. Verify the OpenAI-compatible endpoint

```powershell
Invoke-RestMethod -Method Get -Uri http://127.0.0.1:11434/v1/models
```

If this request works but the app test fails, check the app's base URL carefully. It should end in `/v1`, not `/api`. Restart NOVA AI after changing provider settings if the connection does not refresh.

## Scope and limitations

- Ollama is local and normally does not need a cloud API key.
- Model performance depends on your hardware and selected model.
- This configures the built-in chat engine. Claude, Codex, OpenCode, or other CLI engines still follow their own setup/authentication and model support.
- Do not expose the local Ollama API on a public network without a separately reviewed authentication and network-security design.
