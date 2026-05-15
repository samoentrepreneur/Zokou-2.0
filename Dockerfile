FROM node:20-bookworm

RUN apt-get update && \
    apt-get install -y \
    ffmpeg \
    imagemagick \
    webp \
    git && \
    npm install -g pm2 npm@10.2.4 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./

RUN npm install --legacy-peer-deps

COPY . .

EXPOSE 5000

CMD ["node", "index.js"]
