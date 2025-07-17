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

# Expor porta
EXPOSE 5000

# ⚠️  ABSOLUTAMENTE SEM HEALTHCHECK ⚠️
# Override explícito para garantir que o Coolify não force healthcheck
HEALTHCHECK NONE

# Comando simples de inicialização
CMD ["npm", "start"]
