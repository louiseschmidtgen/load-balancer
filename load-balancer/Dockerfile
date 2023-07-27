FROM nginx:latest

# RUN apt-get update && apt-get install -y \
#     wget \
#     build-essential \
#     gawk \
#     mawk \
#     apt-utils \
#     xinetd \
#     gcc

# # follows documentation on installing the plugin https://assets.nagios.com/downloads/nagioscore/docs/nrpe/NRPE.pdf
# #install nagios plugins
# RUN wget http://nagios-plugins.org/download/nagios-plugins-2.4.5.tar.gz && \
#     tar xzf nagios-plugins-2.4.5.tar.gz 

# RUN cd nagios-plugins-2.4.5 && \
#     ./configure && \
#     make && \
#     make install

# # install nrpe daemon
# RUN wget https://github.com/NagiosEnterprises/nrpe/releases/download/nrpe-4.0.2/nrpe-4.0.2.tar.gz && \
#     tar xzf nrpe-4.0.2.tar.gz

# RUN cd nrpe-nrpe-4.0.2 && \
#     ./configure && \
#     make all && \
#     make install-groups-users && \
#     make install && \
#     make install-config && \
#     # If you want NRPE to run per-connection under inetd, xinetd, launchd, systemd, smf, etc.
#     # make install-inetd && \
#     # If you want to run NRPE all the time under init, launchd, systemd, smf, etc   
#     make install-init 



WORKDIR /load-balancer/load-balancer


# Add the check_load_balancer command to nrpe.cfg using 'tee' command
# RUN echo 'command[check_load_balancer]=/opt/nagios/plugins/check_by_ssh -H localhost -C "/load-balancer/load-balancer/monitor_script.sh"' | tee -a /etc/nagios/nrpe.cfg

# COPY ./monitor_script.sh /load-balancer/load-balancer/monitor_script.sh 

COPY ./nginx.conf /etc/nginx/nginx.conf 