# ----- always pick the latest n8n image -----
FROM n8nio/n8n:latest
USER root

# outils de base au cas où (quasi instantané)
RUN apk add --no-cache git curl tar gzip python3 make g++

# ----- install the *latest* MCP node -----
RUN mkdir -p /home/node/.n8n/custom \
 && npm install --legacy-peer-deps --prefix /home/node/.n8n/custom n8n-nodes-mcp@latest \
 && echo "── dist/nodes (after latest) ──" \
 && ls -1 /home/node/.n8n/custom/node_modules/n8n-nodes-mcp/dist/nodes || true

ENV N8N_CUSTOM_EXTENSIONS="/home/node/.n8n/custom"
USER node
