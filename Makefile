SHELL := /bin/bash
help: ## Show this help
	@echo -e "usage: make [target]\n\n target:"
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/: ##\s*/\t/' | expand -t 18 | pr -to2
build-docker: ## build docker containers
	docker-compose up -d --build
restart-docker: ## restart docker containers
	docker-compose restart
down-docker: ## down docker containers
	docker-compose down
qa: ## run rspec test
	docker exec -ti desafio-backend-ruby rspec
sidekiq: ## run sidekiq worker
	docker exec -ti desafio-backend-ruby sidekiq
ifndef VERBOSE
.SILENT:
endif
