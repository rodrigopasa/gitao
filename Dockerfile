FROM node:20-slim

WORKDIR /app

# Copiar arquivos de dependências
COPY package*.json ./

# Instalar apenas dependências de produção
RUN npm ci --only=production

# Copiar código fonte
COPY . .

# Build da aplicação
RUN npm run build

# Criar diretórios necessários para uploads
RUN mkdir -p uploads/pdfs uploads/thumbnails uploads/avatars uploads/temp

# Configurar permissões
RUN chown -R node:node /app/uploads
USER node

# Expor porta
EXPOSE 5000

# Comando para iniciar
CMD ["npm", "start"]