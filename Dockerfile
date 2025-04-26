# 1. On part de l'image n8n officielle (Alpine + Node)
FROM n8nio/n8n:latest

# 2. Passe en root pour installer le module globalement
USER root

# 3. Installe MCP client + trigger en global (avec --unsafe-perm pour éviter les erreurs de droits)
RUN npm install -g --unsafe-perm n8n-nodes-mcp@latest

# 4. Repasse en node (utilisateur non-priviliégié)
USER node




