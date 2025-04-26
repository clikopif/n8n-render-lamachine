# Image officielle n8n
FROM n8nio/n8n:latest

# ── Installe le paquet MCP en root (sinon EACCES) ──
USER root
RUN npm install -g --unsafe-perm --omit=dev n8n-nodes-mcp@latest

# Reviens à l’utilisateur non-privilégié recommandé par n8n
USER node
# ──────────────────────────────────────────────
