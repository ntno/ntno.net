SHELL:=/bin/bash
env=dev
region=us-east-1
app-name=ntno.net
s3-url=s3://ntno.net

##########################################################################################
docker:
	docker-compose run --rm unix 

serve:
	mkdocs serve -v -a 0.0.0.0:8080

stop: 
	docker-compose down --remove-orphans

deploy-gh:
	@pip3 install -r requirements.txt && \
	mkdocs build && \
	mkdocs gh-deploy -v

deploy-s3:	
	@pip3 install -r requirements.txt && \
	mkdocs build && \
	cd site && \
	aws s3 sync --sse AES256 . $(s3-url)

check-app-name:
ifndef app-name
	$(error app-name is not defined)
endif