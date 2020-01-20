FROM node:alpine as builder
WORKDIR '/app'
COPY ./package.json ./
RUN npm config set registry https://repo1.uhc.com/artifactory/api/npm/npm-virtual/ -g
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build /usr/share/nginx/html
