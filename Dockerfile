FROM node:lts-alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# we have to copy /app/build directory to nginx, and start it
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
