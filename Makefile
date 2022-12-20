SHELL:=/bin/bash
env=prod
region=us-east-2
artifact-bucket="s3://artifacts.ntno.net"
image-artifact-prefix="/img-bundle/"
docs-artifact-prefix="/docs-bundle/"

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
# run from inside docker container 
##########################################################################################
invalidate-distribution: check-env check-region
	eval "$$(buildenv -e $(env) -d $(region))" && \
	export CLOUDFRONT_DISTRIBUTION_ID=`aws ssm get-parameters --name "$$CLOUDFRONT_DISTRIBUTION_ID_SSM_PATH" | jq -r .Parameters[0].Value` && \
	aws cloudfront create-invalidation \
    --distribution-id "$$CLOUDFRONT_DISTRIBUTION_ID" \
    --paths "/*" 

bundle: check-input-path check-version
	tar \
		--dereference --hard-dereference \
		--directory $(input-path) \
		-cvf $(version).tar \
		--exclude=.git \
		--exclude=.github \
		. > $(version)-manifest.txt

upload-image-artifact: check-version check-input-path
	aws s3 cp --sse AES256 $(input-path) "$(artifact-bucket)$(image-artifact-prefix)$(version)/"

download-image-artifact-bundle: check-version check-output-path
	aws s3 cp "$(artifact-bucket)$(image-artifact-prefix)$(version)/$(version).tar" $(output-path)

get-image-bundle: check-download-path 
	eval "$$(buildenv -e $(env) -d $(region))" && \
	$(MAKE) download-image-artifact-bundle version="$$IMAGE_BUNDLE_VERSION" output-path=$(downloadx-path) && \
	tar \
		--directory "./docs/img/" \
		-xf "$(download-path)/$$IMAGE_BUNDLE_VERSION.tar"

upload-docs-artifact: check-version check-input-path
	aws s3 cp --sse AES256 $(input-path) "$(artifact-bucket)$(docs-artifact-prefix)$(version)/"

##########################################################################################

check-env:
ifndef env
	$(error env is not defined)
endif

check-region:
ifndef region
	$(error region is not defined)
endif

check-input-path:
ifndef input-path
	$(error input-path is not defined)
endif

check-output-path:
ifndef output-path
	$(error output-path is not defined)
endif

check-download-path:
ifndef download-path
	$(error download-path is not defined)
endif

check-version:
ifndef version
	$(error version is not defined)
endif