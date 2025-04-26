FROM n8nio/n8n:latest
USER root

# nettoie d'anciens paquets
RUN rm -rf /home/node/.n8n/custom /home/node/.n8n/nodes /home/node/.n8n/node_modules

# installe 0.1.15 (CJS + Client)
RUN mkdir -p /home/node/.n8n/custom \
 && npm install --omit=dev --prefix /home/node/.n8n/custom n8n-nodes-mcp@0.1.15 \
 && echo "── dist/nodes ──" && ls -1 /home/node/.n8n/custom/node_modules/n8n-nodes-mcp/dist/nodes

ENV N8N_CUSTOM_EXTENSIONS="/home/node/.n8n/custom"
# bloque le rechargement des autres versions
ENV N8N_SKIP_LOAD_PACKAGE_MANAGER_INFORMATION="true"

USER node
