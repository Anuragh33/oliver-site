# Oliver website

Single-page marketing site for Oliver. Plain HTML, no build step.

## Local preview

```bash
cd website
python3 -m http.server 4173
```

Then open <http://localhost:4173>.

## Deploy

Any static host works. The whole site is:

```
website/
  index.html
  styles.css
  assets/
    oliver.svg
    providers/*.svg
```

### Cloudflare Pages / Vercel / Netlify

Point the project at the `website/` subdirectory. No build command, no output directory beyond `website/`.

### GitHub Pages

If you want this served from the repo, the simplest path is to move it to `docs/website/` and configure Pages to serve from `/docs`, or push the `website/` directory to a `gh-pages` branch.

## Notes

- Tailwind is loaded via the Play CDN (`cdn.tailwindcss.com`). That is fine for a static landing page; if you ever want to ship without external script tags, swap in the Tailwind CLI to produce a prebuilt CSS bundle.
- The font is Inter, loaded from `rsms.me/inter`.
- No analytics, no trackers, no third-party iframes. Matches the app's privacy stance.
