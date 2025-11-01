longhorn:login
	argocd app sync longhorn

vl:login
	argocd app sync victoria-logs-cluster

login:
	argocd login argocd.aimhighergg.com --grpc-web
