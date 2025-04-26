# Dockerfile à placer à la racine de ton repo n8n
FROM n8nio/n8n:latest
USER root

# Outils nécessaires
RUN apk add --no-cache git curl tar gzip

# Clone MCP (public) et installe
RUN git clone --depth 1 https://github.com/nerding-io/n8n-nodes-mcp /home/node/.n8n/custom \
 && cd /home/node/.n8n/custom && npm install --omit=dev \
 && ls -1 dist/nodes     # doit afficher McpClient.node.js et McpServerTrigger.node.js

ENV N8N_CUSTOM_EXTENSIONS="/home/node/.n8n/custom"
USER node
