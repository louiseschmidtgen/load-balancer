FROM nginx:latest

#Install necessary plugins for nagios monitoring
RUN apt-get update && apt-get install -y build-essential nagios-nrpe-server nagios-plugins net-tools
#listen for requests from nagios-monitor

WORKDIR /load-balancer/load-balancer

# nrpe.cfg allowing traffic from nagios-monitor
COPY ./nrpe.cfg /etc/nagios/nrpe.cfg 

# Nginx config
COPY ./nginx.conf /etc/nginx/nginx.conf 


WORKDIR /load-balancer/load-balancer

# Start the nagios-nrpe-server service
CMD ["service", "nagios-nrpe-server", "start"]
