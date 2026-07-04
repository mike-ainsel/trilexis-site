FROM nginx:1.27-alpine
# Static site — served as-is. Multi-arch (amd64/arm64) is built in CI.
COPY site/ /usr/share/nginx/html/
EXPOSE 80
