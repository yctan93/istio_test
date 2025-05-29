# kubectl delete deployment test -n test

helm delete istiod -n istio-system
helm delete istio-base -n istio-system
helm delete istio-ingressgateway -n istio-system
helm delete istio-egressgateway -n istio-system
helm delete istio-cni  -n istio-system
kubectl delete namespace istio-system
# kubectl delete namespace test
kubectl delete crd $(kubectl get CustomResourceDefinition -A | grep "istio.io" | awk '{print $1}')
# kubectl delete -f test.yaml

# minikube stop
# minikube delete --purge


