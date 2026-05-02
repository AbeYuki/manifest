#!/bin/bash

# 1. Leaf 証明書 renew
kubectl cert-manager renew -n vault vault-server-cert
kubectl cert-manager renew -n argocd avp-client-leaf
kubectl cert-manager renew -n vault traefik-vault-client-leaf

# 2. 再起動
kubectl -n vault rollout restart statefulset/vault
kubectl -n argocd rollout restart deploy/argo-cd-argocd-repo-server