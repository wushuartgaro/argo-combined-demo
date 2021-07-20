apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: argo-combined-app-staging
  namespace: argocd
  finalizers:
    - resources-finalizer.argocd.argoproj.io
spec:
  project: staging
  source:
    path: kustomize/overlays/staging
    repoURL: https://github.com/wushuartgaro/argo-combined-app
    targetRevision: HEAD
    kustomize:
      images:
      - junerongifast/argo-combined-app:latest
  destination:
    server: https://kubernetes.default.svc
    namespace: staging
  syncPolicy:
    automated:
      selfHeal: true
      prune: true
    syncOptions:
    - CreateNamespace=true
