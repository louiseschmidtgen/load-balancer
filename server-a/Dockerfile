FROM nginx:alpine

WORKDIR /load-balancer/server-a

COPY ./static/index.html /usr/share/nginx/html

COPY ./nginx.conf /etc/nginx/nginx.conf 