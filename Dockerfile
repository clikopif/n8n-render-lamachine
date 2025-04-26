FROM n8nio/n8n:latest

USER root
# Installe MCP dans un dossier privé
RUN mkdir -p /home/node/.n8n/custom \
 && npm install --omit=dev --prefix /home/node/.n8n/custom n8n-nodes-mcp@0.1.23 \
 && echo "── Contenu custom ──" \
 && ls -1 /home/node/.n8n/custom/node_modules/n8n-nodes-mcp/dist/nodes

# Indique à n8n où chercher
ENV N8N_CUSTOM_EXTENSIONS="/home/node/.n8n/custom"

USER node
