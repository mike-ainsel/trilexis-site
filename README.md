# trilexis-site

[![build](https://github.com/mike-ainsel/trilexis-site/actions/workflows/build.yml/badge.svg)](https://github.com/mike-ainsel/trilexis-site/actions/workflows/build.yml)
[![staging](https://img.shields.io/badge/staging-lab.trilexis.app-2f9d90)](https://lab.trilexis.app)
[![container](https://img.shields.io/badge/image-ghcr.io%2Ftrilexis--site-4a8fcf?logo=github)](https://github.com/mike-ainsel/trilexis-site/pkgs/container/trilexis-site)

Landing page for **Trilexis** — the iPhone & iPad dictionary app that opens
**StarDict, DSL, MDict, Babylon, ZIM, CC-CEDICT and CSV** dictionaries in one
app, with unified search, iPad Split View, and 100% offline operation.

**Live (staging):** https://lab.trilexis.app

## What's here

| Path | Purpose |
|------|---------|
| `site/` | The static page — plain HTML/CSS, no build step, palette matched to the app icon |
| `Dockerfile` | Bakes `site/` into [`static-web-server`](https://static-web-server.net/) (a tiny ~5 MB Rust static server) |
| `.github/workflows/build.yml` | On push to `main`: build a **multi-arch (amd64/arm64)** image and push to GHCR |

## How it's built & deployed

Pull-based GitOps — nothing pushes into the cluster:

```
push to main ─► GitHub Actions ─► GHCR (main-<sha>-<epoch>, multi-arch)
                                        │
                        Flux (in-cluster) scans GHCR, picks newest tag
                                        │
         staging (lab.trilexis.app) auto-deploys ──► promote ──► prod (trilexis.app)
```

The cluster is a single-node k3s box behind a Cloudflare Tunnel, managed by
[Flux](https://fluxcd.io/) from a private GitOps repo (`dl-k3s`). Staging tracks
every build automatically; prod runs a pinned tag promoted deliberately.

## Local preview

```sh
docker build -t trilexis-site . && docker run --rm -p 8080:80 trilexis-site
# open http://localhost:8080
```
