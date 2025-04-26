FROM n8nio/n8n:latest
USER root

RUN apk add --no-cache git python3 make g++

# ⬇︎ installe la 0.1.18 pré-compilée (dist/ déjà présent)
RUN mkdir -p /home/node/.n8n/custom \
 && npm install --omit=dev --prefix /home/node/.n8n/custom n8n-nodes-mcp@0.1.18 \
 && echo "── dist/nodes ──" \
 && ls -1 /home/node/.n8n/custom/node_modules/n8n-nodes-mcp/dist/nodes

ENV N8N_CUSTOM_EXTENSIONS="/home/node/.n8n/custom"
USER node
