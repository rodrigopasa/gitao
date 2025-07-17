# 🚀 Dockerfile ZERO - SEM healthcheck garantido
FROM node:20-slim

WORKDIR /app

# Instalar dependências primeiro (melhor cache)
COPY package*.json ./
RUN npm ci --only=production=false

# Copiar código e fazer build
COPY . .
RUN npm run build

# Remover dependências de desenvolvimento  
RUN npm prune --production

# Criar diretórios necessários
RUN mkdir -p uploads/pdfs uploads/thumbnails uploads/avatars uploads/temp

# Configurar permissões para usuário node
RUN chown -R node:node /app
USER node

# Expor porta
EXPOSE 5000

# Instalar curl para healthcheck funcional
USER root
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
USER node

# Healthcheck que testa se a aplicação está realmente funcionando
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
  CMD curl -f http://localhost:5000/health || exit 1

# Comando simples de inicialização
CMD ["npm", "start"]
