FROM nginx:alpine

WORKDIR /load-balancer/server-b

COPY ./static/index.html /usr/share/nginx/html

COPY ./nginx.conf /etc/nginx/nginx.conf 