# Dockerfile à la racine de TON dépôt n8n
FROM n8nio/n8n:latest
USER root

# Outils indispensables dans l'image Alpine de n8n
RUN apk add --no-cache git curl tar gzip

# Clone public du node MCP, puis installation
RUN git clone --depth 1 https://github.com/nerding-io/n8n-nodes-mcp /home/node/.n8n/custom \
 && cd /home/node/.n8n/custom && npm install --omit=dev \
 && ls -1 dist/nodes    # --> doit lister McpClient.node.js et McpServerTrigger.node.js

# Indique à n8n où se trouve le node
ENV N8N_CUSTOM_EXTENSIONS="/home/node/.n8n/custom"
USER node
