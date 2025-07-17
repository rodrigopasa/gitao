FROM node:20-slim

WORKDIR /app

# Copiar arquivos de configuração
COPY package*.json ./

# Instalar dependências
RUN npm ci --only=production=false

# Copiar código fonte
COPY . .

# Build da aplicação
RUN npm run build

# Limpar dependências de desenvolvimento
RUN npm prune --production

# Criar diretórios necessários
RUN mkdir -p uploads/pdfs uploads/thumbnails uploads/avatars uploads/temp

# Expor porta
EXPOSE 5000

# FORÇA REMOÇÃO DE QUALQUER HEALTHCHECK
HEALTHCHECK NONE

# Comando de inicialização simples
CMD ["npm", "start"]
