# This make file simplifies the docker-compose operations
# This make file allows you to specify a specific container to build by passing the option c=server-a for example

.PHONY: build build-no-cache up start down destroy stop restart sh ps logs playbook-destroy

build:
	docker-compose -f docker-compose.yml build $(c)

build-no-cache:
	docker-compose -f docker-compose.yml build --no-cache $(c)

builder-prune:
	docker builder prune
up:
	docker-compose -f docker-compose.yml up -d $(c)

start:
	docker-compose -f docker-compose.yml start $(c)

down:
	docker-compose -f docker-compose.yml down $(c)

destroy:
	docker-compose -f docker-compose.yml down -v $(c)

stop:
	docker-compose -f docker-compose.yml stop $(c)

restart:
	docker-compose -f docker-compose.yml stop $(c)
	docker-compose -f docker-compose.yml up -d $(c)

sh: 
	docker-compose exec server bash
ps:
	docker ps

logs:
	docker-compose -f docker-compose.yml logs --tail=100 -f $(c)

playbook-load-balancer:
	ansible-playbook -i inventory.yml playbook/deploy_containers.yml
	ansible-playbook -i inventory.yml playbook/load-balancer.yml

playbook-nagios-monitor:
	ansible-playbook -i inventory.yml playbook/deploy_containers.yml
	ansible-playbook -i inventory.yml playbook/nagios-monitor.yml

playbook-server-a:
	ansible-playbook -i inventory.yml playbook/deploy_containers.yml
	ansible-playbook -i inventory.yml playbook/server-a.yml

playbook-server-b:
	ansible-playbook -i inventory.yml playbook/deploy_containers.yml
	ansible-playbook -i inventory.yml playbook/server-b.yml

playbook-all:
	ansible-playbook -i inventory.yml playbook/deploy_containers.yml
	# ansible-playbook -i inventory.yml playbook/load-balancer.yml
	# ansible-playbook -i inventory.yml playbook/nagios-monitor.yml
	# ansible-playbook -i inventory.yml playbook/server-a.yml
	# ansible-playbook -i inventory.yml playbook/server-b.yml

playbook-destroy:
	ansible-playbook -i inventory.yml playbook/destroy_containers.yml


# Test SSH connectivity to each server
test-ssh:
	@echo "Testing SSH connectivity to servers:"
	@ansible -i inventory.yml all -m ping