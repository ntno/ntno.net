#!/bin/bash
# example use: source deploy.sh dev us-east-1
# $1 - environment name (ex: dev, prod)
# $2 - datacenter/region name (ex: us-east-1, us-west-2)

## build
source ./scripts/build.sh $1 $2

## deploy
eval "$(buildenv -e $1 -d $2)" && \
aws s3 sync --size-only --sse AES256 ./site/ "s3://$DOMAIN_NAME"

make invalidate-distribution env=$1 region=$2