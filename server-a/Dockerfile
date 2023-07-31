FROM nginx:latest

#Install necessary plugins for nagios monitoring
RUN apt-get update && apt-get install -y build-essential nagios-nrpe-server nagios-plugins 

WORKDIR /load-balancer/server-a

COPY ./nrpe.cfg /etc/nagios/nrpe.cfg 

COPY ./static/index.html /usr/share/nginx/html

COPY ./nginx.conf /etc/nginx/nginx.conf 

# Start the nagios-nrpe-server service
CMD ["sh", "-c", "service nagios-nrpe-server start && nginx -g 'daemon off;'"]