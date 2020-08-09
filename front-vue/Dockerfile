FROM node:14.5-alpine
WORKDIR /front-vue
COPY package*.json ./
RUN yarn install
COPY . .
CMD ["yarn", "serve"]