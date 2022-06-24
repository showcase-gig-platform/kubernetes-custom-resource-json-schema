# kubernetes-custom-resource-json-schema

This repository is made for use with [kubeconform](https://github.com/yannh/kubeconform).  
We store JSON schemas convert from CRDs as used in our cluster.

## How to use

```
kubeconform -schema-location default -schema-location "https://raw.githubusercontent.com/showcase-gig-platform/kubernetes-custom-resource-json-schema/main/schemas/{{ .ResourceKind }}{{ .KindSuffix }}.json" mymanifest.yaml
```

## Supported CRDs

### argocd

https://github.com/argoproj/argo-cd/

### aws-load-balancer-controller

https://github.com/kubernetes-sigs/aws-load-balancer-controller

### cert-manager

https://github.com/cert-manager/cert-manager

### custom-metrics-generator

https://github.com/showcase-gig-platform/custom-metrics-generator

### external-secrets

https://github.com/external-secrets/external-secrets

## Generate schemas

```
FILENAME_FORMAT="{kind}-{group}-{version}" WRITE_DIR=schemas make build-all
```
