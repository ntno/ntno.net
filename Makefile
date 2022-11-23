SHELL:=/bin/bash
env=prod
region=us-east-2

##########################################################################################
# run docker/serve/build/deploy/stop commands from local machine
##########################################################################################
docker: 
	docker-compose run --rm ubuntu

stop: 
	docker compose down --remove-orphans

serve: check-env check-region
	docker compose run --entrypoint "/bin/bash" --service-ports local_development_server -c "source ./scripts/serve.sh $(env) $(region)"

build: check-env check-region
	docker compose run --entrypoint "/bin/bash" ubuntu -c "source ./scripts/build.sh $(env) $(region)"

deploy: check-env check-region
	docker compose run --entrypoint "/bin/bash" ubuntu -c "source ./scripts/deploy.sh $(env) $(region)"

open-local:
	open http://0.0.0.0:7000/

open:
	open https://ntno.net
	
##########################################################################################

check-env:
ifndef env
	$(error env is not defined)
endif

check-region:
ifndef region
	$(error region is not defined)
endif
