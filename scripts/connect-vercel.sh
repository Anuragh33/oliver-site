#!/usr/bin/env bash
# Connect the Vercel project to its GitHub repo so every push to main
# triggers a production deploy and every PR gets a preview URL.
#
# Prereqs:
#   1. `npm i -g vercel`  (or pin via npx)
#   2. `vercel login`     (must be the team that owns .vercel/project.json)
#
# Safe to re-run — Vercel reports the existing connection if already set.

set -euo pipefail

if ! command -v vercel >/dev/null 2>&1; then
  echo "Vercel CLI not found. Install with: npm i -g vercel" >&2
  exit 1
fi

exec vercel git connect https://github.com/Anuragh33/oliver-site
