FROM node:16 as builder

WORKDIR /app
COPY . .
RUN npm ci
RUN npm run build

FROM nginx:1.23 as base
COPY --from=builder /app/build /usr/share/nginx/html