FROM n8nio/n8n:latest

USER root
# Installe la bêta qui apporte le client
RUN mkdir -p /home/node/.n8n/custom \
 && npm install --omit=dev --prefix /home/node/.n8n/custom n8n-nodes-mcp@0.2.0-beta.1 \
 && echo "── Contenu custom ──" \
 && ls -1 /home/node/.n8n/custom/node_modules/n8n-nodes-mcp/dist/nodes

ENV N8N_CUSTOM_EXTENSIONS="/home/node/.n8n/custom"
USER node
