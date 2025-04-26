FROM n8nio/n8n:latest
USER root

# Outils système + build
RUN apk add --no-cache git curl tar gzip python3 make g++

# Clone, install (avec dev-deps), compile, puis liste
RUN git clone --depth 1 https://github.com/nerding-io/n8n-nodes-mcp /home/node/.n8n/custom \
 && cd /home/node/.n8n/custom \
 && npm install --legacy-peer-deps        # ← TÉLÉCHARGE AUSSI typescript, gulp, etc. \
 && npm run build                         # génère dist/ \
 && echo "── dist/nodes ──" && ls -1 dist/nodes

ENV N8N_CUSTOM_EXTENSIONS="/home/node/.n8n/custom"
USER node

