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

build:
	@pip3 install -r requirements.txt && \
	mkdocs build

add-s3-404-page:
	cp site/error/index.html site/error.html

deploy-gh: update-robots build
	mkdocs gh-deploy -v

deploy-s3: update-robots build add-s3-404-page
	cd site && \
	aws s3 sync --size-only --sse AES256 . $(s3-url)

update-robots: check-app-name
	rm -f ./docs/robots.txt
	curl https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master/robots.txt/robots.txt --output ./docs/robots.txt

check-app-name:
ifndef app-name
	$(error app-name is not defined)
endif