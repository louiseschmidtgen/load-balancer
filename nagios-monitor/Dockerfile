FROM jasonrivers/nagios:latest

WORKDIR /load-balancer/nagios-monitor

# package nagios-nrpe-plugin is already installed in the manios/nagios:latest base image.
RUN apt-get update && apt-get install -y build-essential nagios-nrpe-plugin nagios-plugins-contrib net-tools
# nagios-nrpe nagios-plugins

# Copy Nagios configuration files
# CGI config in: /opt/nagios/etc/cgi.cfg

# /opt/nagios/libexec/check_nrpe

COPY /nagios/config/nagios.cfg /opt/nagios/etc/nagios.cfg
COPY /nagios/config/commands.cfg /opt/nagios/etc/objects/commands.cfg
COPY /nagios/config/contacts.cfg /opt/nagios/etc/objects/contacts.cfg
COPY /nagios/config/load-balancer.cfg /opt/nagios/etc/objects/load-balancer.cfg
COPY /nagios/config/server-a.cfg /opt/nagios/etc/objects/server-a.cfg
COPY /nagios/config/server-b.cfg /opt/nagios/etc/objects/server-b.cfg

# COPY /nagios/plugins/check_load_balancer.sh /opt/Custom-Nagios-Plugins/check_load_balancer.sh
# RUN chmod +x /opt/Custom-Nagios-Plugins/check_load_balancer.sh

# Expose necessary ports for NRPE
# EXPOSE 5666

# CMD ["/opt/nagios/bin/nagios", "/opt/nagios/etc/nagios.cfg"]

