# This make file simplifies the docker-compose operations
# This make file allows you to specify a specific container to build by passing the option c=serverA for example

.PHONY: build up start down destroy stop restart logs

build:
	docker-compose -f docker-compose.yml build $(c)

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

# # Build the container
# build: ## Build the container
# 	docker build -t $(APP_NAME) .

# build-nc: ## Build the container without caching
# 	docker build --no-cache -t $(APP_NAME) .

# run: ## Run container on port configured in `config.env`
# 	docker run -i -t --rm --env-file=./config.env -p=$(PORT):$(PORT) --name="$(APP_NAME)" $(APP_NAME)
