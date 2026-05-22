# Oliver

**Invisible AI overlay for macOS meetings.**

Oliver sits above every window, listens to your meeting, and streams answers from the model of your choice. It does not appear in screen recordings or shared screens. No backend relay. No telemetry.

## Download

Get the latest signed and notarized DMG from [Releases](https://github.com/Anuragh33/oliver-site/releases).

**Requirements:** macOS 13 or later · Apple Silicon

## Features

- Invisible overlay — excluded from screen capture at the OS level (`NSWindowSharingNone`)
- Six AI providers: OpenAI, Anthropic Claude, Google Gemini, Groq, OpenRouter, Ollama
- Live transcription via local Whisper or the OpenAI Whisper API
- Streaming answers with real token usage counts
- Screenshot context — attach the current screen to any prompt
- File attachments — up to 8,000 characters of context per conversation
- Scrollable answer history per session
- Encrypted API key storage (AES-GCM-SIV · local SQLite)
- Global hotkeys, all remappable from the dashboard

## Privacy

Every model request goes directly from your machine to the provider you configured. No proxy, no relay, no analytics, no crash reporting. Conversations, transcripts, and API keys stay on your device. Each release is signed with a Developer ID Application certificate and notarized by Apple.

## Install

1. Download `Oliver_x.x.x_aarch64.dmg` from [Releases](https://github.com/Anuragh33/oliver-site/releases/latest)
2. Open the DMG and drag Oliver into Applications
3. Launch Oliver — macOS will prompt for microphone and screen recording access
4. Open the dashboard, go to AI Models, and paste an API key from any supported provider
5. (Optional) Install BlackHole 2ch from inside the dashboard to capture system audio

## Local preview of this site

```bash
python3 -m http.server 4173
```

Open `http://localhost:4173`. No build step — plain HTML and CSS.
