# helm install istio-base -n istio-system /Users/yongchintan/Desktop/Test/istio_test/charts/base 
# helm install istiod -n istio-system /Users/yongchintan/Desktop/Test/istio_test/charts/istio-control/istio-discovery/ #--set meshConfig.outboundTrafficPolicy.mode=REGISTRY_ONLY
# helm install istio-ingressgateway  -n istio-system /Users/yongchintan/Desktop/Test/istio_test/charts/gateway_ingress
# helm install istio-egressgateway  -n istio-system /Users/yongchintan/Desktop/Test/istio_test/charts/gateway_egress
# helm install istio-cni  -n istio-system /Users/yongchintan/Desktop/Test/istio_test/charts/istio-cni

# kubectl apply -f test.yaml

minikube start --kubernetes-version=v1.30.5

kubectl create namespace istio-system
minikube image load istio/pilot:1.25.3
minikube image load istio/proxyv2:1.25.3
minikube image load istio/install-cni:1.25.3
minikube image load busybox:latest

kubectl create namespace istio-system
kubectl apply -f gitRepo.yaml
kubectl apply -f helmReleaseBase.yaml
kubectl apply -f helmReleaseIstiod.yaml
sleep 5
kubectl apply -f helmReleaseIngress.yaml
kubectl apply -f helmReleaseEgress.yaml

# kubectl apply -f test.yaml