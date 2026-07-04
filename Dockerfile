# static-web-server (Rust) — ~5MB scratch image, non-root, gzip/brotli + cache
# headers out of the box. Defaults: serves /public on port 80. Multi-arch in CI.
FROM ghcr.io/static-web-server/static-web-server:2
COPY site/ /public
EXPOSE 80
