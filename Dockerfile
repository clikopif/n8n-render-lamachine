FROM n8nio/n8n:latest
USER root

# Installe la branche principale du repo (avec dist déjà buildé)
RUN mkdir -p /home/node/.n8n/custom \
 && npm install --omit=dev --prefix /home/node/.n8n/custom \
      git+https://github.com/modelcontextprotocol/n8n-nodes-mcp.git#main \
 && echo "── dist/nodes ──" \
 && ls -1 /home/node/.n8n/custom/node_modules/n8n-nodes-mcp/dist/nodes

ENV N8N_CUSTOM_EXTENSIONS="/home/node/.n8n/custom"
USER node
