# stage 1
FROM node:18.13.0-alpine as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# stage 2
FROM nginx:alpine
COPY --from=node /app/dist/angular-gke-demo/browser /usr/share/nginx/html