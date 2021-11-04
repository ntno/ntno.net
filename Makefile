SHELL:=/bin/bash
env=dev
region=us-east-1
app-name=ntno.net


##########################################################################################
docker:
	docker-compose run --rm unix 

serve:
	mkdocs serve -v -a 0.0.0.0:8080

deploy:
	@pip3 install -r requirements.txt && \
	mkdocs build && \
	mkdocs gh-deploy -v

check-app-name:
ifndef app-name
	$(error app-name is not defined)
endif