# stage 1
FROM node:12.5.0 as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

FROM nginx:latest
COPY --from=node /app/dist/angular-app /usr/share/nginx/html
