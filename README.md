# Animate favicon

Live demos of a 3D model unfurling into an animated browser tab icon (Three.js → 32×32 PNG → `<link rel="icon">`).

**Site:** https://townie.github.io/animate-favicon/

## Demos

- [3D Favicon Unfurl](demo.html) — full interactive demo (plays once on load)
- [Looping unfurl demo](demo2.html) — automatic fold/unfold loop

## GitHub Pages (fully automated)

Push to `main` and the workflow handles everything in code:

1. **[`scripts/ensure-github-pages.sh`](scripts/ensure-github-pages.sh)** — enables Pages and sets `build_type=workflow` via the GitHub API
2. **[`.github/workflows/pages.yml`](.github/workflows/pages.yml)** — runs that script, then deploys `index.html`, the demos, and `.nojekyll`

No manual **Settings → Pages** step is required. The first successful run must be triggered by someone with admin access to the repository (a normal push to `main` is enough).
