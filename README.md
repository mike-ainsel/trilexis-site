# trilexis-site

[![build](https://github.com/mike-ainsel/trilexis-site/actions/workflows/build.yml/badge.svg)](https://github.com/mike-ainsel/trilexis-site/actions/workflows/build.yml)

Landing page for **Trilexis** — the iPhone & iPad dictionary app that opens
**StarDict, DSL, MDict, Babylon, ZIM, CC-CEDICT and CSV** dictionaries in one
app, with unified search, iPad Split View, and 100% offline operation.

## Contents

- `site/` — the static page (plain HTML/CSS, no build step)
- `Dockerfile` — packages `site/` into a small static web server
- `.github/workflows/build.yml` — builds a multi-arch container image on push

## Local preview

```sh
docker build -t trilexis-site . && docker run --rm -p 8080:80 trilexis-site
# open http://localhost:8080
```
