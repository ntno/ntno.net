SHELL:=/bin/bash
env=dev
region=us-east-1
app-name=ntno.net
s3-url=s3://ntno.net

##########################################################################################
# run docker/serve/stop commands from local machine
##########################################################################################
docker: 
	docker-compose run --rm ubuntu

stop: 
	docker-compose down --remove-orphans

serve:
	docker-compose run --service-ports local_development_server

open-local:
	open http://0.0.0.0:7000/

open:
	open https://ntno.net

##########################################################################################
# run build/deploy commands from docker container
##########################################################################################
build:
	@pip3 install -r requirements.txt && \
	mkdocs build

add-s3-404-page:
	cp site/error/index.html site/error.html

deploy-s3: update-robots build add-s3-404-page
	cd site && \
	aws s3 sync --size-only --sse AES256 . $(s3-url)

update-robots:
	rm -f ./docs/robots.txt
	curl https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master/robots.txt/robots.txt --output ./docs/robots.txt
