<div align="center">

<img src="assets/oliver.svg" width="100" height="100" alt="Oliver" />

<h1>Oliver</h1>

<p><strong>Invisible AI overlay for macOS meetings</strong></p>

<p>
Oliver sits above every window on your screen, listens to your meeting,<br />
and streams answers from the AI model you choose — in real time.<br />
It never appears in screen recordings or screen shares.
</p>

<br />

[![Website](https://img.shields.io/badge/Website-oliver--site-3dd6a0?style=for-the-badge&logo=vercel&logoColor=black)](https://oliver-site-psi.vercel.app)
&nbsp;
[![Download DMG](https://img.shields.io/github/v/release/Anuragh33/oliver-site?style=for-the-badge&color=ffffff&label=Download+DMG&logo=apple&logoColor=black)](https://github.com/Anuragh33/oliver-site/releases/latest)
&nbsp;
[![macOS](https://img.shields.io/badge/macOS_13%2B-required-1c1c1e?style=for-the-badge&logo=apple&logoColor=white)](https://github.com/Anuragh33/oliver-site/releases/latest)
&nbsp;
[![Apple Silicon](https://img.shields.io/badge/Apple_Silicon-aarch64-1c1c1e?style=for-the-badge)](https://github.com/Anuragh33/oliver-site/releases/latest)

</div>

<br />

---

**Live site:** [oliver-site-psi.vercel.app](https://oliver-site-psi.vercel.app)

---

## How it works

Press **`⌘ L`** during a meeting. Oliver captures what was just said, sends it to the AI model you configured, and streams the answer into a floating response panel — invisible to everyone else on the call.

No typing. No alt-tabbing. No switching apps. You hear a question, you press a key, you get an answer.

The overlay window is excluded from screen capture at the OS level using `NSWindowSharingNone`. Zoom, Teams, Google Meet, and every screen recorder tested see a clean desktop — Oliver simply does not exist to them.

---

## Providers

Oliver connects directly to six AI providers. Your API key goes straight from your machine to the provider — no proxy, no relay, nothing in between.

<br />

<div align="center">
<table>
  <tr>
    <td align="center" width="110">
      <img src="assets/providers/openai.svg" height="30" alt="OpenAI" />
      <br /><sub><b>OpenAI</b></sub>
    </td>
    <td align="center" width="110">
      <img src="assets/providers/anthropic.svg" height="30" alt="Anthropic" />
      <br /><sub><b>Anthropic</b></sub>
    </td>
    <td align="center" width="110">
      <img src="assets/providers/gemini.svg" height="30" alt="Google Gemini" />
      <br /><sub><b>Gemini</b></sub>
    </td>
    <td align="center" width="110">
      <img src="assets/providers/groq.svg" height="30" alt="Groq" />
      <br /><sub><b>Groq</b></sub>
    </td>
    <td align="center" width="110">
      <img src="assets/providers/openrouter.svg" height="30" alt="OpenRouter" />
      <br /><sub><b>OpenRouter</b></sub>
    </td>
    <td align="center" width="110">
      <img src="assets/providers/ollama.svg" height="30" alt="Ollama" />
      <br /><sub><b>Ollama</b></sub>
    </td>
  </tr>
</table>
</div>

<br />

| Provider | Streaming | Vision | Runs locally |
|---|:---:|:---:|:---:|
| OpenAI | ✓ | ✓ | — |
| Anthropic Claude | ✓ | ✓ | — |
| Google Gemini | ✓ | ✓ | — |
| Groq | ✓ | — | — |
| OpenRouter | ✓ | ✓ | — |
| Ollama | ✓ | model-dependent | ✓ |

Configure endpoints and models per provider from the dashboard. Ollama auto-discovers your local models. Switch providers mid-session without losing history.

---

## Features

### Live transcription
Mic is captured through CoreAudio, system audio through ScreenCaptureKit — no extra drivers required. 3-second chunks are sent to Whisper (local or OpenAI Whisper API). Transcription auto-debounces and re-queues if the model is already streaming, so nothing is dropped.

### Streaming answers
All six provider adapters stream token-by-token with real usage counts where the provider reports them. Every answer in a session is kept in a scrollable thread — scroll back to re-read an earlier response without losing what's currently streaming.

### Prompt modes
Three built-in system prompts cover the most common cases: **General** for any meeting, **Interview** for job interviews (first-person, STAR-form behaviorals, structured technicals), and **Work Meeting** (direct, position-first, single trade-off). Write your own modes for sales calls, support escalations, pitch reviews, anything — the active mode shapes every answer.

### Screenshot context
One hotkey (`⌘ ⇧ S`) attaches your current screen to the next prompt. Vision-capable models see exactly what you see. Non-vision models receive a graceful skip.

### File attachments
Drop a file into the dashboard to prime the conversation with up to 8,000 characters of context. Stored per conversation in local SQLite so it persists across restarts.

### Keyboard-first, no focus steal
With Accessibility permission granted, Oliver intercepts keystrokes for its own input field without taking focus from Zoom, Meet, or whatever's active. Type while the meeting keeps going.

### Conversation history & usage stats
Every meeting is saved locally with its transcript, prompts, attachments, and answers. A dedicated usage stats panel shows total sessions, estimated tokens, per-day activity, and recent input/output token counts.

### System audio
Captured through ScreenCaptureKit by default. BlackHole 2ch is installable from the dashboard as an optional fallback if you'd rather route through a virtual audio device.

### Start-meeting preflight
Before each session, Oliver runs a checklist: provider key, STT, microphone (with a live 3-second test), Accessibility permission, and optional BlackHole. If anything's missing or broken, you find out before joining the call, not during.

### Encrypted key storage
API keys are encrypted with AES-GCM-SIV before being written to SQLite. The encryption key is derived per install and stored outside the database.

---

## Global hotkeys

All shortcuts are remappable from the dashboard. Conflict detection runs before you save.

| Action | Default shortcut |
|---|---|
| Toggle overlay | `⌘ ⇧ Space` |
| Trigger AI answer | `⌘ L` |
| Capture screenshot | `⌘ ⇧ S` |
| Start / stop voice input | `⌘ ⇧ V` |
| Open dashboard | `⌘ ⇧ D` |

---

## Privacy

Oliver is built to be impossible to observe from the outside — including by us. There is no server to opt out of, because there is no server.

| | |
|---|---|
| **No telemetry** | Zero analytics calls, no crash reporters, no "anonymous usage" tracking. Verify it yourself in Little Snitch. |
| **No relay server** | Every model request originates from your machine and terminates at the provider you configured. Nothing in between. |
| **Screen-share safe** | Window sharing is disabled at the AppKit layer. The overlay does not appear in Zoom, Teams, Google Meet, or any screen recorder tested. |
| **Local persistence** | Conversations, transcripts, and attachments live in your app data folder. Delete the folder, delete everything. |
| **Encrypted at rest** | API keys are encrypted with AES-GCM-SIV before being written to SQLite. The encryption key is stored outside the database. |
| **No hidden processes** | Oliver runs no background daemons, launch agents, or auto-updaters. Quit it and it's gone. Verify with Activity Monitor or Little Snitch. |

---

## Install

**1 — Download**

Grab the latest `Oliver_0.1.1_aarch64.dmg` from [**Releases**](https://github.com/Anuragh33/oliver-site/releases/latest). Open the DMG and drag Oliver into Applications.

> **First launch:** the build is unsigned, so Gatekeeper will block it.
>
> - macOS 13–14: right-click (or Control-click) Oliver in Applications and choose **Open**.
> - macOS 15+ (Sequoia): right-click → Open no longer works. Clear the quarantine flag once in Terminal:
>
>   ```bash
>   xattr -dr com.apple.quarantine /Applications/Oliver.app
>   ```
>
> You only need to do this once.

**2 — Grant permissions**

On first launch macOS will prompt for **Microphone** and **Screen Recording** access. Both are required — microphone for voice capture, screen recording for the system audio pipeline.

**3 — Connect a provider**

Open the dashboard (`⌘ ⇧ D`), go to **AI Models**, and paste an API key for any supported provider. Keys are encrypted before they touch disk.

**4 — Start a meeting**

Click **Start Meeting** in the dashboard. Oliver hides itself and begins listening. Press `⌘ L` after you hear something you want answered. The response streams into the panel above the bar.

**5 — System audio (built-in)**

The other side of the call is captured through ScreenCaptureKit automatically once you grant the Screen Recording permission — no driver install required. If you'd rather route through a virtual audio device, the Start Meeting checklist offers a one-click BlackHole 2ch installer as a fallback.

---

## Uninstall

Drag `Oliver.app` from Applications to the Trash, then remove the local data folder:

```bash
rm -rf ~/Library/Application\ Support/com.anuraghragidimilli.oliver
```

That's everything. No daemons, no launch agents, no auto-updaters.

---

## Requirements

- macOS 13 Ventura or later
- Apple Silicon (M1 or later)
- An API key from at least one supported provider, or Ollama running locally

---

## What's new

The latest release notes are on the [Releases page](https://github.com/Anuragh33/oliver-site/releases/latest). The website's [Changelog section](https://oliver-site-psi.vercel.app/#changelog) renders them inline, fetched live from GitHub.

---

## Site

**Production:** [oliver-site-psi.vercel.app](https://oliver-site-psi.vercel.app), hosted on Vercel.

> Git auto-deploy is not currently connected on the Vercel side, so pushes to `main` don't redeploy automatically. To enable it (one-time setup), run:
>
> ```bash
> ./scripts/connect-vercel.sh
> ```
>
> Or in the Vercel dashboard: **`oliver-site` → Settings → Git → Connect Git Repository → Anuragh33/oliver-site**. After that, every push to `main` triggers a production deploy and every PR gets a preview URL.

**Manual deploy** (until Git is connected, or for ad-hoc pushes):

```bash
vercel --prod
```

**Local preview:**

```bash
python3 -m http.server 4173
```

Open `http://localhost:4173`. No build step — plain HTML and CSS.

---

<div align="center">
<br />
<img src="assets/oliver.svg" width="40" height="40" alt="Oliver" />
<br />
<sub>Oliver &nbsp;·&nbsp; <a href="https://oliver-site-psi.vercel.app">oliver-site-psi.vercel.app</a> &nbsp;·&nbsp; macOS 13+ &nbsp;·&nbsp; Apple Silicon</sub>
<br /><br />

[![Website](https://img.shields.io/badge/Website-live-3dd6a0?style=flat-square&logo=vercel&logoColor=black)](https://oliver-site-psi.vercel.app)
&nbsp;
[![Download](https://img.shields.io/github/v/release/Anuragh33/oliver-site?style=flat-square&color=ffffff&label=latest+release&logo=apple&logoColor=black)](https://github.com/Anuragh33/oliver-site/releases/latest)

</div>
