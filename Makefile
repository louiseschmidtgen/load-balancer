# This make file simplifies the docker-compose operations
# This make file allows you to specify a specific container to build by passing the option c=server-a for example

.PHONY: build build-no-cache up start down destroy stop restart sh ps logs

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

playbook:
	ansible-playbook -i inventory.yml deploy_containers.yml
