# Define Variables
APP_PORT=3031
DEPLOYMENT_YAML="deployment.yaml"
SERVICE_YAML="service.yaml"

# Run Build and port forward commands
up: build port-forward

# To build image to the MiniKube Docker Engine 
build:
	@echo "Configure shell to use the Docker daemon inside Minikube....."
	eval $(minikube -p minikube docker-env)
	@echo "Building docker image...."
	docker build -t job-aggregator .

# Specify a fixed port for the Minikube tunnel by using a proxy
port-forward:
	@echo "Port forwarding to $(APP_PORT)...."
	kubectl port-forward service/job-aggregator-service $(APP_PORT):$(APP_PORT)

# Kubernetes related commands
kube-apply: kube-apply-deploy kube-apply-service

kube-apply-deploy:
	kubectl apply -f $(DEPLOYMENT_YAML)

kube-apply-service:
	kubectl apply -f $(SERVICE_YAML)
