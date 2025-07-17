# Coolify Deploy - Passo a Passo

## 📋 Checklist Pré-Deploy

- [ ] Repositório Git pronto (GitHub/GitLab)
- [ ] Coolify instalado no servidor
- [ ] Acesso ao painel Coolify

## 🎯 Configuração no Coolify

### 1. Nova Aplicação
1. Acesse seu Coolify
2. Clique "New Project"
3. Escolha "Public Repository"
4. Cole a URL do seu repositório Git

### 2. Configurações Básicas
```
Name: pdfxandria
Description: Sistema de PDFs
```

### 3. Build Settings
```
Build Pack: Dockerfile
Dockerfile Location: ./Dockerfile
Port: 5000
```

### 4. Banco de Dados
1. No mesmo projeto, clique "Add Database"
2. Escolha "PostgreSQL"
3. Name: `pdfxandria-db`
4. Copie a URL de conexão gerada

### 5. Environment Variables
```
DATABASE_URL=postgresql://usuario:senha@host:5432/database
NODE_ENV=production
PORT=5000
```

### 6. Storage (Volumes)
```
Source: /var/lib/coolify/volumes/pdfxandria-uploads
Destination: /app/uploads
```

## 🚀 Deploy

1. Clique "Deploy"
2. Aguarde o build (2-3 minutos)
3. Acesse o domínio gerado

## ✅ Teste

- Acesse o site público
- Teste login admin: `Hisoka` / `Fudencio992#`
- Faça upload de um PDF teste

## 🔧 Troubleshooting

### Build Failed?
```bash
# Verifique os logs no Coolify
# Problema comum: dependências
npm ci --legacy-peer-deps
```

### Database Error?
```bash
# Teste conexão:
psql $DATABASE_URL
```

### Permissions Error?
```bash
# No container:
chown -R node:node /app/uploads
```

## 📞 Suporte Rápido

**Erro mais comum:** DATABASE_URL incorreta
**Solução:** Copie a URL exata do banco criado no Coolify

**Tempo médio de deploy:** 5-10 minutos
**Status esperado:** ✅ Running (verde)