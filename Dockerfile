FROM node:20-bookworm

ENV PUPPETEER_SKIP_DOWNLOAD=true

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

RUN git config --global url."https://github.com/".insteadOf "ssh://git@github.com/"

RUN npm install --legacy-peer-deps --force

COPY . .

EXPOSE 5000

CMD ["node", "index.js"]
