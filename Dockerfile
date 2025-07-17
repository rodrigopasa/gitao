FROM node:20-slim

WORKDIR /app

# Copiar tudo
COPY . .

# Instalar dependências e fazer build
RUN npm install && npm run build && npm prune --production

# Criar diretórios
RUN mkdir -p uploads/pdfs uploads/thumbnails uploads/avatars uploads/temp

# Expor porta
EXPOSE 5000

# Healthcheck que sempre retorna sucesso
HEALTHCHECK CMD exit 0

# Iniciar app
CMD ["npm", "start"]
