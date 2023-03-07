
# This is a multi-stage build. 
# The first stage builds the app. 
FROM node:16-alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# The second runs the app.
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html