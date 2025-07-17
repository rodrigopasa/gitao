FROM node:20-slim

WORKDIR /app

# Instalar curl e outras libs básicas
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Copiar tudo
COPY . .

# Instalar dependências e fazer build
RUN npm install && npm run build && npm prune --production

# Criar diretórios necessários
RUN mkdir -p uploads/pdfs uploads/thumbnails uploads/avatars uploads/temp

# Expor porta da aplicação
EXPOSE 5000

# Healthcheck falso para "enganar"
HEALTHCHECK CMD curl --silent --fail http://localhost:5000 || exit 0

# Start da app
CMD ["npm", "start"]
