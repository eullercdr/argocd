FROM node:14-slim

RUN npm install -g @nestjs/cli

RUN mkdir -p /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm run build

RUN chmod +x /home/node/app/.docker/entrypoint.sh

ENTRYPOINT [ ".docker/entrypoint.sh" ]