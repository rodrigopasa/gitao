FROM node:20-slim

WORKDIR /app

# Copiar package.json primeiro para cache de dependências
COPY package*.json ./

# Instalar dependências (incluindo dev para build)
RUN npm install

# Copiar resto do código
COPY . .

# Build da aplicação frontend e backend
RUN npm run build

# Remover dependências de desenvolvimento para otimizar
RUN npm prune --production

# Criar diretórios para uploads
RUN mkdir -p uploads/pdfs uploads/thumbnails uploads/avatars uploads/temp

# Configurar permissões
RUN chown -R node:node /app

# Usar usuário não-root
USER node

# Expor porta
EXPOSE 5000

# Comando de inicialização (SEM healthcheck)
CMD ["npm", "start"]
