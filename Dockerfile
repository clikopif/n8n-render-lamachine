FROM n8nio/n8n:latest
USER root

# 1. Outils nécessaires + deps de build (node-gyp)
RUN apk add --no-cache git curl tar gzip python3 make g++  # python/make/g++ = build deps

# 2. Clone, installe, compile, puis vérifie
RUN git clone --depth 1 https://github.com/nerding-io/n8n-nodes-mcp /home/node/.n8n/custom \
 && cd /home/node/.n8n/custom \
 && npm install --omit=dev \
 && npm run build        # ← génère le dossier dist/ • prend ~20 s \
 && echo "── dist/nodes ──" && ls -1 dist/nodes

# 3. Dossier des extensions custom
ENV N8N_CUSTOM_EXTENSIONS="/home/node/.n8n/custom"
USER node
