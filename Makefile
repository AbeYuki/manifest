longhorn:login
	argocd app sync longhorn

login:
	argocd login argocd.aimhighergg.com --grpc-web