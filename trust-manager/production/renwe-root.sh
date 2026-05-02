#!/bin/bash

# 1. Root CA を手動 renew
kubectl cert-manager renew -n cert-manager vault-root-ca

# 2. bundle source Secret を更新
kubectl -n cert-manager get secret vault-root-ca-secret \
  -o jsonpath='{.data.tls\.crt}' | base64 -d | \
kubectl -n cert-manager create secret generic vault-root-ca-secret-bundle \
  --from-file=ca.pem=/dev/stdin \
  --dry-run=client -o yaml | \
kubectl apply -f -

# 3. Leaf 証明書 renew
kubectl cert-manager renew -n vault vault-server-cert
kubectl cert-manager renew -n argocd avp-client-leaf
kubectl cert-manager renew -n vault traefik-vault-client-leaf

# 4. 再起動
kubectl -n vault rollout restart statefulset/vault
kubectl -n argocd rollout restart deploy/argo-cd-argocd-repo-server