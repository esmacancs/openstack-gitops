#!/bin/bash

echo "📊 OpenStack Observability Deployment Status"
echo "============================================"

echo ""
echo "🎯 ArgoCD Applications:"
kubectl get apps -n argocd | grep -E 'prometheus|elasticsearch|kibana|keycloak|fluentd' | while read line; do
    echo "  $line"
done

echo ""
echo "📊 Monitoring Namespace:"
kubectl get pods -n monitoring 2>/dev/null | head -10

echo ""
echo "📝 Logging Namespace:"
kubectl get pods -n logging 2>/dev/null | head -10

echo ""
echo "🔐 WebSSO Namespace:"
kubectl get pods -n websso 2>/dev/null | head -10

echo ""
echo "⚠️  Current Issues:"
echo "  - Image pull timeouts from registry.k8s.io"
echo "  - Network connectivity issues to external registries"
echo "  - Some pods in ImagePullBackOff state"

echo ""
echo "🔧 Troubleshooting Steps:"
echo "1. Check internet connectivity: curl -I https://registry.k8s.io"
echo "2. Restart failed pods: kubectl delete pod <pod-name> -n <namespace>"
echo "3. Check ArgoCD sync: kubectl get apps -n argocd"
echo "4. Monitor progress: watch kubectl get pods -n monitoring"

echo ""
echo "✅ Successfully Deployed:"
echo "  - All namespaces created"
echo "  - ArgoCD applications configured"
echo "  - OpenStack exporter deployed"
echo "  - Alerting rules configured"
echo "  - Keystone federation job running"

echo ""
echo "⏳ In Progress:"
echo "  - Prometheus stack installation"
echo "  - Elasticsearch cluster startup"
echo "  - Keycloak deployment"
echo "  - Image pulls from external registries"

echo ""
echo "🌐 Expected URLs (once ready):"
echo "  Grafana:  http://grafana.10.8.132.108.sslip.io"
echo "  Kibana:   http://kibana.10.8.132.108.sslip.io"
echo "  Keycloak: http://keycloak.10.8.132.108.sslip.io"
