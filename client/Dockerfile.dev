FROM node:alpine
WORKDIR '/app'
COPY ./package.json ./
RUN npm config set registry https://repo1.uhc.com/artifactory/api/npm/npm-virtual/ -g
RUN npm install
COPY . .
CMD ["npm", "run", "start"]
