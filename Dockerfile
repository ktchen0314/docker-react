FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
#RUN npm install
RUN npm install -g npm@7.16.0
COPY . .
RUN npm run build


FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

# There's no need to put "CMD ..."  here, because
# the nginx image will run neginx by default.
