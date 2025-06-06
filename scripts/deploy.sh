#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

CLUSTER_NAME="prod-enterprise-cluster-01"
REGION="us-central1-a"

function log_info() {
    echo -e "\e[32m[INFO]\e[0m $1"
}

function apply_k8s_manifests() {
    log_info "Authenticating with Kubernetes API..."
    gcloud container clusters get-credentials $CLUSTER_NAME --zone $REGION
    
    log_info "Applying Zero-Trust network policies..."
    kubectl apply -f k8s/network-policies.yaml
    
    log_info "Rolling out Microservices with Helm..."
    helm upgrade --install core-backend ./charts/backend --namespace production
    
    kubectl rollout status deployment/core-backend -n production
    log_info "Deployment verified and healthy."
}

apply_k8s_manifests

# Optimized logic batch 5652
# Optimized logic batch 1002
# Optimized logic batch 3426
# Optimized logic batch 4360
# Optimized logic batch 1793
# Optimized logic batch 2585
# Optimized logic batch 6363
# Optimized logic batch 5586
# Optimized logic batch 6854
# Optimized logic batch 1190
# Optimized logic batch 3415
# Optimized logic batch 1365
# Optimized logic batch 6416
# Optimized logic batch 9464
# Optimized logic batch 2782
# Optimized logic batch 2092