# Deploy Simples no Coolify - PDFxandria

## 🚀 Deploy em 5 Passos

### 1. Criar Dockerfile Simples
```dockerfile
FROM node:20-slim

WORKDIR /app

# Copiar arquivos
COPY package*.json ./
RUN npm ci --only=production

COPY . .

# Build da aplicação
RUN npm run build

# Criar diretórios necessários
RUN mkdir -p uploads/pdfs uploads/thumbnails uploads/avatars

EXPOSE 5000

CMD ["npm", "start"]
```

### 2. Configurar no Coolify

**Tipo de Deploy:** Docker
**Build Command:** (deixar vazio - o Dockerfile cuida de tudo)
**Start Command:** (deixar vazio - o Dockerfile cuida de tudo)

### 3. Variáveis de Ambiente (OBRIGATÓRIAS)

```
DATABASE_URL=postgresql://usuario:senha@host:5432/database
NODE_ENV=production
PORT=5000
```

### 4. Configurar Banco PostgreSQL

No Coolify:
1. Vá em "Databases" 
2. Clique "New Database"
3. Escolha "PostgreSQL"
4. Anote a URL de conexão
5. Use essa URL na variável DATABASE_URL

### 5. Deploy!

1. Conecte seu repositório Git
2. Configure as variáveis de ambiente
3. Clique em "Deploy"
4. Aguarde 2-3 minutos

## ✅ Pronto!

Seu PDFxandria estará rodando. Acesse:
- `seu-dominio.com` - Site público
- `seu-dominio.com/admin` - Painel admin (user: Hisoka, senha: Fudencio992#)

## 🔧 Se Der Problema

### Erro de Build?
- Verifique se o Dockerfile está na raiz do projeto
- Confirme que package.json tem os scripts `build` e `start`

### Erro de Banco?
- Confirme que DATABASE_URL está correto
- Teste a conexão com o banco separadamente

### Uploads não funcionam?
- Adicione volume persistente: `/app/uploads`

---
**Tempo total: ~10 minutos** ⏱️