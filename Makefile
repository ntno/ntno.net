SHELL:=/bin/bash
env=dev
region=us-east-1
app-name=ntno.net


##########################################################################################
stop: check-app-name
	docker-compose down --remove-orphans

build: check-app-name
	docker build -f ./Dockerfile . -t $(app-name):latest

docker:
	docker-compose run --rm unix 

serve: build
	docker-compose up --remove-orphans $(app-name)

deploy:
	@pip3 install -r requirements.txt && \
	mkdocs build && \
	mkdocs gh-deploy -v

check-app-name:
ifndef app-name
	$(error app-name is not defined)
endif