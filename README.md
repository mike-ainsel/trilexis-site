# trilexis-site

Static landing page for **Trilexis** — the iPhone & iPad dictionary app for
StarDict, DSL, and MDict.

- `site/` — the static page (plain HTML/CSS, no build step, fully offline-friendly).
- `Dockerfile` — bakes `site/` into `nginx:alpine`.
- `.github/workflows/build.yml` — on push to `main`, builds a **multi-arch
  (amd64/arm64)** image and pushes it to `ghcr.io/mike-ainsel/trilexis-site`.

## Deployment

Pull-based GitOps: **Flux** on the `dl-k3s` cluster watches this image in GHCR
and rolls out new tags automatically (manifests live in the `dl-k3s` repo under
`apps/preview/`). Nothing here pushes to the cluster — the k3s API stays private.

Live (pre-launch): `preview.lab.trilexis.app`.

## Local preview

    docker build -t trilexis-site . && docker run --rm -p 8080:80 trilexis-site
    # open http://localhost:8080
