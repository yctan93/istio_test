# minikube start --kubernetes-version=v1.30.5
kubectl create namespace istio-system
# minikube image load istio/pilot:1.25.3
# minikube image load istio/proxyv2:1.25.3
# minikube image load istio/install-cni:1.25.3
# minikube image load busybox:latest

helm install istio-base -n istio-system /Users/yongchintan/Desktop/Test/istio/base 
helm install istiod -n istio-system /Users/yongchintan/Desktop/Test/istio/istio-control/istio-discovery/ #--set meshConfig.outboundTrafficPolicy.mode=REGISTRY_ONLY
helm install istio-ingressgateway  -n istio-system /Users/yongchintan/Desktop/Test/istio/gateway_ingress
helm install istio-egressgateway  -n istio-system /Users/yongchintan/Desktop/Test/istio/gateway_egress
helm install istio-cni  -n istio-system /Users/yongchintan/Desktop/Test/istio/istio-cni

# kubectl apply -f test.yaml
# kubectl create deployment test --image=busybox:latest -n test
