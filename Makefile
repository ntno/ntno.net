SHELL:=/bin/bash
env=prod
region=us-east-2
artifact-bucket=s3://artifacts.ntno.net
image-artifact-prefix=$(artifact-bucket)/img-bundle/
docs-artifact-prefix=$(artifact-bucket)/docs-bundle/

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

setup-mkdocs: check-env check-region check-download-directory
	$(MAKE) get-image-bundle

build-mkdocs: check-env check-region
	source ./scripts/build.sh $(env) $(region)

archive-mkdocs: check-env check-region check-version
	$(MAKE) bundle input-directory="./site" output-directory="./" bundle-filename="docs-site.tar" manifest-filename="manifest.txt"
	$(MAKE) upload-docs-artifact file="./docs-site.tar"
	$(MAKE) upload-docs-artifact file="./manifest.txt"

get-mkdocs-archive:  check-env check-region check-version check-download-directory
	mkdir -p site
	$(MAKE) download-docs-artifact file="docs-site.tar" output-path=$(download-directory) && \
	tar \
		--directory "./site/" \
		-xf $(download-directory)docs-site.tar 

deploy-mkdocs: check-env check-region check-bucket-name
	aws s3 sync --no-progress --sse AES256 --acl public-read ./site/ s3://$(bucket-name)/

##########################################################################################
# run from inside docker container 
##########################################################################################
invalidate-distribution: check-env check-region
	eval "$$(buildenv -e $(env) -d $(region))" && \
	export CLOUDFRONT_DISTRIBUTION_ID=`aws ssm get-parameters --name "$$CLOUDFRONT_DISTRIBUTION_ID_SSM_PATH" | jq -r .Parameters[0].Value` && \
	aws cloudfront create-invalidation \
    --distribution-id "$$CLOUDFRONT_DISTRIBUTION_ID" \
    --paths "/*" 

bundle: check-input-directory check-output-directory check-bundle-filename check-manifest-filename
	tar \
		--dereference --hard-dereference \
		--directory $(input-directory) \
		-cvf $(output-directory)$(bundle-filename) \
		--exclude=.git \
		--exclude=.github \
		. > $(output-directory)$(manifest-filename)

upload-docs-artifact: check-version check-file
	aws s3 cp --no-progress --sse AES256 $(file) $(docs-artifact-prefix)$(version)/

download-docs-artifact: check-version check-file check-output-path
	aws s3 cp --no-progress $(docs-artifact-prefix)$(version)/$(file) $(output-path)

put-image-bundle: check-version
	$(MAKE) bundle input-directory="./docs/img" output-directory="./" version=$(version) bundle-filename="$(version).tar" manifest-filename="$(version)-manifest.txt" && \
	aws s3 cp --sse AES256 $(version).tar $(image-artifact-prefix)$(version)/ && \
	aws s3 cp --sse AES256 $(version)-manifest.txt $(image-artifact-prefix)$(version)/

get-image-bundle: check-env check-region check-download-directory 
	eval "$$(buildenv -e $(env) -d $(region))" && \
	aws s3 cp --no-progress $(image-artifact-prefix)$$IMAGE_BUNDLE_VERSION/$$IMAGE_BUNDLE_VERSION.tar $(download-directory) && \
	tar \
		--directory "./docs/img/" \
		-xf $(download-directory)$$IMAGE_BUNDLE_VERSION.tar && \
	rm -f $(download-directory)$$IMAGE_BUNDLE_VERSION.tar

##########################################################################################

check-env:
ifndef env
	$(error env is not defined)
endif

check-region:
ifndef region
	$(error region is not defined)
endif

check-input-directory:
ifndef input-directory
	$(error input-directory is not defined)
endif

check-output-directory:
ifndef output-directory
	$(error output-directory is not defined)
endif

check-download-directory:
ifndef download-directory
	$(error download-directory is not defined)
endif

check-version:
ifndef version
	$(error version is not defined)
endif

check-bundle-filename:
ifndef bundle-filename
	$(error bundle-filename is not defined)
endif

check-manifest-filename:
ifndef manifest-filename
	$(error manifest-filename is not defined)
endif

check-file:
ifndef file
	$(error file is not defined)
endif

check-output-path:
ifndef output-path
	$(error output-path is not defined)
endif

check-bucket-name:
ifndef bucket-name
	$(error bucket-name is not defined)
endif