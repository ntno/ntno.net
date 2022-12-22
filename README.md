# ntno.net

## local development
```make serve```

### download images for local development
```
make get-image-bundle download-directory="."
```

## deployment
```make deploy```

## image update
1. add/update image
2. test locally
```
make serve
```
3. create image release
```
make docker
make put-image-bundle version="X.X.X"
```
4. update `IMAGE_BUNDLE_VERSION` in variables.yml


## notes
```aws s3 sync --dryrun --sse AES256 --exclude '*.mov' --exclude '*.MOV' s3://ntno.net/img/ docs/img/```

## references
- https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions  