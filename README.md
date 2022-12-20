# ntno.net

## local development
```make serve```

## deployment
```make deploy```

## notes
```aws s3 sync --dryrun --sse AES256 --exclude '*.mov' --exclude '*.MOV' s3://ntno.net/img/ docs/img/```

## create bundle
```
make bundle input-path="./docs/img" version="0.0.0"
```

## upload bundle
```
make upload-image-artifact input-path="./0.0.0.tar" version="0.0.0"
make upload-image-artifact input-path="./0.0.0-manifest.txt" version="0.0.0"  
```