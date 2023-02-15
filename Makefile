RUN_CONTEXT ?= docker-compose exec gatsby
RUN_CYPRESS ?= docker-compose run --rm cypress run

up: ## Start containers and tail their logs.
	docker-compose up -d
	@make logs

down: ## Stop containers.
	docker-compose down --remove-orphans

restart: down up ## Restart containers and tail their logs.

logs: ## Tail container logs.
	docker-compose logs -f

build: ## Build containers.
	docker-compose build

.PHONY: cypress
cypress/check:
	$(RUN_CYPRESS)

cypress/update:
	$(RUN_CYPRESS) --env updateSnapshots=true

bash: ## Start bash on gatsby container.
	$(RUN_CONTEXT) bash

prettier/check:
	$(RUN_CONTEXT) yarn prettier --check {gatsby-*.js,src/**/*.js,cypress/**/*.js}

prettier/fix:
	$(RUN_CONTEXT) yarn prettier -w {gatsby-*.js,src/**/*.js,cypress/**/*.js}

eslint/check:
	$(RUN_CONTEXT) yarn eslint --ext js src

eslint/fix:
	$(RUN_CONTEXT) yarn eslint --fix --ext js src
