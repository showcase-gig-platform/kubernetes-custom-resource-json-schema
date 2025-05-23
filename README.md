# kubernetes-custom-resource-json-schema

This repository is made for use with [kubeconform](https://github.com/yannh/kubeconform).  
This repository contains JSON schemas convert from CRDs that we want.

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

### actions-runner-controller

https://github.com/actions-runner-controller/actions-runner-controller

### istio

https://github.com/istio/istio

## Generate/Update schemas

### A specific schema

```
FILENAME_FORMAT="{kind}-{version}" make build-all
```

### All schemas

```
make build-all
```