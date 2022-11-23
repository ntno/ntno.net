# ntno.net

## local development
```make serve```

## deployment
```make deploy```

## notes
```aws s3 sync --dryrun --sse AES256 --exclude '*.mov' --exclude '*.MOV' s3://ntno.net/img/ docs/img/```