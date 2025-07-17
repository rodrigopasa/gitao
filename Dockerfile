FROM node:20-slim

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build
RUN npm prune --production

RUN mkdir -p uploads/pdfs uploads/thumbnails uploads/avatars uploads/temp

EXPOSE 5000

CMD ["npm", "start"]
