# This make file simplifies the docker-compose operations
# This make file allows you to specify a specific container to build by passing the option c=server-a for example

.PHONY: build build-no-cache up start down destroy stop restart sh ps logs playbook-destroy

# Run the Ansible playbook to deploy the containers to the four servers
playbook-all:
	ansible-playbook -i inventory.yml playbook/deploy_containers.yml

playbook-destroy:
	ansible-playbook -i inventory.yml playbook/destroy_containers.yml

# To build the containers locally, run the following commands:
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

logs:
	docker-compose -f docker-compose.yml logs --tail=100 -f $(c)

# Test SSH connectivity to each server
test-ssh:
	@echo "Testing SSH connectivity to servers:"
	@ansible -i inventory.yml all -m ping