#!/bin/bash

set -eou pipefail

# List of image names
IMAGES=(
  "shoppingassistantservice"
  "shippingservice"
  "recommendationservice"
  "paymentservice"
  "loadgenerator"
  "emailservice"
  "currencyservice"
  "cartservice"
  "adservice"
  "productcatalogservice"
  "checkoutservice"
  "my-frontend"
)

# Load each image into minikube
for image in "${IMAGES[@]}"; do
  echo "Loading $image into Minikube..."
  minikube image load $image
done

# Verify
minikube image ls

echo "All images loaded to Minikube successfully!"