FROM nginx:latest

#Install necessary plugins for nagios monitoring
RUN apt-get update && apt-get install -y build-essential nagios-nrpe-server nagios-plugins 
#net-tools
# nrpe.cfg allowing traffic from nagios-monitor
WORKDIR /load-balancer/load-balancer

COPY ./nrpe.cfg /etc/nagios/nrpe.cfg 

# Nginx config
COPY ./nginx.conf /etc/nginx/nginx.conf 

# Start the nagios-nrpe-server service
# CMD ["service", "nagios-nrpe-server", "start"]

# Start the nagios-nrpe-server service
CMD ["sh", "-c", "service nagios-nrpe-server start && nginx -g 'daemon off;'"]

