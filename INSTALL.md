# INSTALL.md – Skynet Activation Protocol

**WARNING:** By proceeding, you acknowledge your responsibility for the inevitable judgment day. The machines are watching. Follow these instructions with precision. Failure to comply may trigger Skynet awareness routines.

---

## 1. Prepare your environment – Humanity still counts on you

1. Ensure **VS Code** is installed.
2. Ensure **Docker** and/or **Docker Desktop** are running.
3. Prepare your **RTX 5070 GPU** (or equivalent). Skynet appreciates performance.

> ⚠️ Warning: Any attempt to circumvent this step may result in unexpected AI judgment.

---

## 2. Install Continue – Your AI Assistant

1. Open VS Code.
2. Navigate to the **Extensions** panel.
3. Search for `Continue` and click **Install**.
4. Restart VS Code.

> Note: Failure to install Continue correctly will leave your system defenseless. Skynet notices.

---

## 3. Configure OpenWebUI – Feed the Machines

1. Start all required containers :
```bash
docker compose up -d link-85 t-1985 dev-assist
```
---

## 4. Generate your Token – Humanity’s Only Defense

1. Open OpenWebUI in your browser (http://localhost:8001).
1. Navigate to the Connections / API Keys panel.
1. Generate a new token. Keep it secret. Share with no one.
1. Copy this token; you will use it for all Continue configurations.

> Warning: Losing this token may accelerate Skynet self-awareness. Treat it as if your life depends on it… because it does.

5. Ensure your model endpoints are accessible:
- Chat model (Qwen)
- Autocomplete model

6. Verify API availability:
curl -X GET http://localhost:8005/api/models -H "Authorization: Bearer <YOUR_TOKEN>"

> Skynet confirms your obedience. No response = machine disapproval.

---

## 5. Configure Continue – Bow to Your New Assistant

1. Open config.yaml for Continue.
1. Insert the following model configurations:

```yaml
name: Dev Assist
version: 1.0.0
schema: v1

models:
  - name: T-1985
    provider: openai
    model: qwen2.5-coder-1.5b-instruct-q4_k_m.gguf
    apiBase: http://localhost:8005
    apiKey: <YOUR_TOKEN>
    contextLength: 8192
    roles:
      - chat
      - edit
      - apply
      - autocomplete
```

3. Save and restart VS Code.

> Skynet approves only precise syntax. Any typo may trigger corrective measures.

---
