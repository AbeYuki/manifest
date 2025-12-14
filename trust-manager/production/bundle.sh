#!/bin/bash

kubectl delete -n cert-manager configmap vault-ca-bundle && \
kubectl -n cert-manager get secret vault-root-ca-secret -o jsonpath='{.data.tls\.crt}' \
 | base64 -d \
 | kubectl -n cert-manager create configmap vault-ca-bundle --from-file=ca.pem=/dev/stdin 
kubectl rollout restart deploy argo-cd-argocd-repo-server -n argocd