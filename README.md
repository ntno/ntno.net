# ntno.net

## live environments
### integration (gh-ci)
temporary environments are created/destroyed with pull request open/close  

url: posted to the pull request for review  
status:   
   [![Test Pull Request](https://github.com/ntno/ntno.net/actions/workflows/test-pr.yml/badge.svg)](https://github.com/ntno/ntno.net/actions/workflows/test-pr.yml)

### production (gh-prod)
url: [https://ntno.net](https://ntno.net)    
status:  
   [![Deploy MkDocs to Production Environment](https://github.com/ntno/ntno.net/actions/workflows/prod-deploy.yml/badge.svg)](https://github.com/ntno/ntno.net/actions/workflows/prod-deploy.yml)


## local development

```
make serve
```

### download images for local development
```
make get-image-bundle download-directory="."
```

### image update

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


## references
- https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions  
- https://docs.github.com/en/actions/using-workflows/reusing-workflows


## see also
- [ntno/tf-ntno.net](https://github.com/ntno/tf-ntno.net) 
- [ntno/tf-module-static-site-cicd](https://github.com/ntno/tf-module-static-site-cicd)  
- [ntno/build-mkdocs-composite-action](https://github.com/ntno/build-mkdocs-composite-action)  
- [ntno/deploy-mkdocs-composite-action](https://github.com/ntno/deploy-mkdocs-composite-action)  
