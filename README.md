# load-balancer
This is a solution for a load-balancer infrastructure challenge.

In this challenge, you have four Ubuntu 20.04 servers with IP addresses 34.219.237.131, 35.86.172.0, 54.212.209.5, and 35.87.133.164. Your task is to create a miniature environment with the following components:

    Two Web Servers: Set up two web servers to serve 'a' and 'b' content at index.html.

    Load Balancer: Install a load balancer on the third server (IP: 54.212.209.5) to distribute traffic between the web servers using any balancing scheme. Configure it to be "sticky," passing the original IP and forwarding ports 60000-65000 to port 80 of the web servers.

    Nagios Monitoring: Set up Nagios on the fourth server (IP: 35.87.133.164) to monitor all servers, including the load balancer.

    User Management: Create a user 'expensify' on all servers with sudo access, using the provided public keys for authentication.

    Network Security: Limit SSH access to one server, allowing access to the others via that server. Block unused and unnecessary ports for improved security.
