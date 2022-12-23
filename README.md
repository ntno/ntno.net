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
```
      - name: Checkout
        uses: actions/checkout@v3export BUILD_TAG=""
      - name: Download Triggering Workflow Artifacts
        env:
          GH_TOKEN: ${{ github.token }}
        run: gh run download ${{ github.event.workflow_run.id }} -D artifacts
      - name: Display structure of downloaded files
        run: ls -ltrR
        working-directory: artifacts
      - name: Inspect artifact
        id: inspect-build-sha
        run: |
          cat ./artifacts/github_sha_from_build/github_sha_from_build  >> $GITHUB_OUTPUT
          echo $GITHUB_OUTPUT
```

## references
- https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions  
- https://docs.github.com/en/actions/using-workflows/reusing-workflows
