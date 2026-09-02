# Personal AI Agent (Langflow)

A tool-using AI agent built with [Langflow](https://github.com/langflow-ai/langflow) — connects to Gemini, and can search the web, do calculations, remember context, and (via Composio) send Gmail emails and create Google Calendar events.

This repo contains the exported flow (`Simple-Agent.json`) and a `Dockerfile` used for the Azure Container Apps deployment. For everyday personal use, you don't need Docker or the cloud — just run it locally on your own PC using the steps below.

---

## 🚀 Quick Start — Run Locally (whenever you need it)

Every time you want to use the agent, just do this:

```bash
cd C:\projects
myenv\Scripts\activate
uv run langflow run
```

Wait for this line in the terminal:

```
[OK] Open Langflow -> http://localhost:7860
```

Then open **http://localhost:7860** in your browser, sign in, and click **Simple Agent** → **Playground**. That's it — no re-import, no re-setup needed.

> ⚠️ First message after starting up can be a little slow (cold start + tool-calling steps). Later messages are faster.

---

## ⚡ Even Faster — One-Click Start

Instead of typing the 3 commands every time, save this as `start_agent.bat` inside `C:\projects`:

```bat
cd C:\projects
call myenv\Scripts\activate
uv run langflow run
```

Next time, just **double-click `start_agent.bat`** — it activates the environment and starts Langflow automatically. Then open `http://localhost:7860` in your browser.

---

## 🛠️ First-Time Setup (only if `myenv` doesn't exist yet)

```bash
py -3.12 -m venv myenv
myenv\Scripts\activate
uv pip install langflow
uv run langflow run
```

> **Important:** Use Python **3.12.x**, not 3.14 — Langflow has compatibility issues with Python 3.14. Check your version with `python --version` after activating.

If you ever need to reload the agent flow from scratch (fresh Langflow install), import it manually:
1. Download [`Simple-Agent.json`](./Simple-Agent.json) from this repo.
2. In Langflow, click **+ New Flow → Import**, and select the file.
3. Re-enter your Gemini / Composio API keys in the relevant component boxes (these aren't saved in the exported JSON for security).

---

## ☁️ Cloud Version (optional)

This repo's `Dockerfile` is what's used to deploy the same agent to **Azure Container Apps**, making it accessible from a phone/anywhere on the internet. That's a separate, optional step — not required for personal local use.

---

## 🧰 Troubleshooting

| Problem | Fix |
|---|---|
| `uv run langflow run` fails / crashes | Check `python --version` inside the activated venv — must be 3.12.x |
| Browser won't open / page not found | Check the terminal for the exact URL + port it printed (can vary: 7860 or 7861) |
| Agent doesn't respond in Playground | Give it 10–15 seconds (tool-calling takes time); if still nothing, check the Gemini API key field in the flow |
| "Address already in use" error | Run `uv run langflow run --port 7862` to use a different port |
