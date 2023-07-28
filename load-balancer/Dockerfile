FROM nginx:latest

#Install necessary plugins for nagios monitoring
RUN apt-get update && apt-get install -y build-essential nagios-nrpe-server nagios-plugins net-tools
#listen for requests from nagios-monitor

WORKDIR /load-balancer/load-balancer

# nrpe.cfg allowing traffic from nagios-monitor
COPY ./nrpe.cfg /etc/nagios/nrpe.cfg 

# Nginx config

COPY ./nginx.conf /etc/nginx/nginx.conf 

# # Add the check_load_balancer command to nrpe.cfg using 'tee' command
# RUN echo 'command[check_load_balancer]=/opt/nagios/plugins/check_by_ssh -H localhost -C "/load-balancer/load-balancer/monitor_script.sh"' | tee -a /etc/nagios/nrpe.cfg

# COPY ./monitor_script.sh /load-balancer/load-balancer/monitor_script.sh 

# Start the nagios-nrpe-server service
CMD ["service", "nagios-nrpe-server", "start"]