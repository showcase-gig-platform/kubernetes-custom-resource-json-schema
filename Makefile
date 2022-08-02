SHELL = /usr/bin/env bash -o pipefail

.PHONY: build-all
build-all: \
	argocd \
	aws-load-balancer-controller \
	cert-manager \
	custom-metrics-generator \
	external-secrets \
	patch-operator


.PHONY: argocd
argocd: ## build argocd custom resource json schema
	./openapi2jsonschema.py <(kustomize build "github.com/argoproj/argo-cd/manifests/crds?ref=master")

.PHONY: aws-load-balancer-controller
aws-load-balancer-controller: ## build aws-load-balancer-controller custom resource json schema
	./openapi2jsonschema.py <(kustomize build "github.com/aws/eks-charts/stable/aws-load-balancer-controller/crds?ref=master")

.PHONY: cert-manager
cert-manager: ## build cert-manager custom resource json schema
	$(eval version := $(shell curl -sS https://api.github.com/repos/cert-manager/cert-manager/releases/latest | jq -r '.tag_name'))
	./openapi2jsonschema.py https://github.com/cert-manager/cert-manager/releases/download/$(version)/cert-manager.crds.yaml

.PHONY: custom-metrics-generator
custom-metrics-generator: ## build custom-metrics-generator custom resource json schema
	./openapi2jsonschema.py https://raw.githubusercontent.com/showcase-gig-platform/custom-metrics-generator/main/manifest/deploy/crd.yaml

.PHONY: external-secrets
external-secrets: ## build external-secrets-operator custom resource json schema
	./openapi2jsonschema.py https://raw.githubusercontent.com/external-secrets/external-secrets/main/deploy/crds/bundle.yaml

.PHONY: patch-operator
patch-operator: ## build patch-operator custom resource json schema
  ./openapi2jsonschema.py https://raw.githubusercontent.com/redhat-cop/patch-operator/main/config/crd/bases/redhatcop.redhat.io_patches.yaml
