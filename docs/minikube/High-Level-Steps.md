# High-Level Steps to Run Online Boutique on Minikube (M1 Mac)

These steps guide you from local Docker images to a fully running, monitored microservices app on a local Minikube cluster.

### Step 1: Set Up Minikube Cluster
- **What**: Install and start Minikube—a single-node Kubernetes cluster running locally on your M1 Mac.
- **Why**:  
  - Creates a local Kubernetes environment to test your services without cloud dependencies.  
  - Offers fast, offline iteration—your foundation for all subsequent steps.

### Step 2: Load Docker Images into Minikube
- **What**: Import your locally built Docker images (e.g., `my-frontend:latest`) into Minikube’s Docker daemon.
- **Why**:  
  - Minikube uses its own Docker—your Mac’s images need to be transferred for Kubernetes to use them.  
  - Avoids pushing to a remote registry—keeps it local and quick.

### Step 3: Create Kubernetes Manifests
- **What**: Write YAML files (e.g., Deployments, Services) for each microservice (`frontend`, `productcatalogservice`, etc.).
- **Why**:  
  - Defines how Kubernetes deploys and connects your services—pods, networking, replicas.  
  - Provides the base configuration needed before packaging or automation.

### Step 4: Package with Helm
- **What**: Convert manifests into a Helm chart—a templated, reusable package for your app.
- **Why**:  
  - Simplifies deployment with a single command (`helm install`) instead of multiple YAML applies.  
  - Enables parameterization—adjust settings like replicas or ports without editing files.  
  - Prepares for GitOps tools like ArgoCD—standardizes deployment.

### Step 5: Deploy to Minikube with Helm
- **What**: Use Helm to install your chart into Minikube, running all services.
- **Why**:  
  - Launches your app—services start and interact (e.g., `frontend` calls `productcatalogservice`).  
  - Tests your manifests and chart locally—validates the setup.

### Step 6: Set Up Ingress
- **What**: Configure an Ingress resource and controller to expose `frontend` to your Mac’s localhost.
- **Why**:  
  - Allows access to the app—e.g., browse `http://localhost`—without manual port-forwarding.  
  - Simulates real-world routing—prepares for production ingress setups.

### Step 7: Introduce ArgoCD for GitOps
- **What**: Install ArgoCD in Minikube, point it to a Git repo with your Helm chart, and enable auto-deployment on changes.
- **Why**:  
  - Automates deployment—Git commits trigger Minikube updates via GitOps.  
  - Centralizes config in Git—source of truth, no manual applies.

### Step 8: Add Monitoring with Prometheus and Grafana
- **What**: Deploy Prometheus (metrics) and Grafana (visualization) to monitor your services.
- **Why**:  
  - Provides observability—track health, performance, and errors across microservices.  
  - Helps debug issues—e.g., spot `frontend` failures or latency spikes.

### Step 9: Test and Iterate
- **What**: Access the app via Ingress, tweak manifests/Helm, watch ArgoCD sync, and check metrics in Grafana.
- **Why**:  
  - Validates the full stack—running services, automation, and monitoring.  
  - Refines your setup locally—builds confidence for production.