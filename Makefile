longhorn:login
	argocd app sync longhorn

vl:login
	argocd app sync victoria-logs-cluster

monitoring:login
	argocd app sync monitoring --prune

login:
	argocd login argocd.aimhighergg.com --grpc-web
