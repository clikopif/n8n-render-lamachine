FROM n8nio/n8n:latest
RUN npm install -g --omit=dev n8n-nodes-mcp@latest
