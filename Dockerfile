FROM n8nio/n8n:latest
USER root

# outils de base manquants dans l'image
RUN apt-get update \
 && apt-get install -y --no-install-recommends curl ca-certificates tar gzip \
 && rm -rf /var/lib/apt/lists/*

ARG MCP_TARBALL=https://codeload.github.com/modelcontextprotocol/n8n-nodes-mcp/tar.gz/refs/heads/main

# ─── Télécharge & installe le paquet ───
RUN mkdir -p /home/node/.n8n/custom \
 && curl -L $MCP_TARBALL | tar -xz --strip-components=1 -C /home/node/.n8n/custom \
 && cd /home/node/.n8n/custom \
 && npm install --omit=dev \
 && echo "── dist/nodes ──" \
 && ls -1 dist/nodes

# Indique à n8n où trouver les nodes
ENV N8N_CUSTOM_EXTENSIONS="/home/node/.n8n/custom"
USER node
