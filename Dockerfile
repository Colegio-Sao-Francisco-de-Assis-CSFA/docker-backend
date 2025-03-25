FROM node:20.18.3-alpine

LABEL \
  version="1.0" \
  owner="Colégio São Francisco de Assis" \
  description="Container com as dependências de BackEnd do site do CSFA"

WORKDIR /app

# Copia apenas os arquivos de dependências para aproveitar cache de build
COPY package.json ./
#COPY package-lock.json ./

# Instala as dependências
RUN npm install

# O volume externo vai montar o código-fonte por cima de /app
# Mas os node_modules já estarão instalados na imagem
CMD ["npm", "run", "dev"]
