FROM jasonrivers/nagios:latest

WORKDIR /load-balancer/nagios-monitor

# # Create Nagios configuration directories
RUN mkdir -p /usr/local/nagios/etc/
RUN mkdir -p /usr/local/nagios/var/

# Copy Nagios configuration files

COPY nagios.cfg /usr/local/nagios/etc/nagios.cfg
COPY hosts.cfg /usr/local/nagios/etc/hosts.cfg
COPY services.cfg /usr/local/nagios/etc/services.cfg
COPY commands.cfg /usr/local/nagios/etc/commands.cfg
COPY nagios.log /usr/local/nagios/var/nagios.log

