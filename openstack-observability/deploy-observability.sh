#!/bin/bash

echo "🚀 Deploying OpenStack Observability Stack"
echo "=========================================="

# Deploy monitoring stack
echo "📊 1. Deploying Monitoring (Prometheus + Grafana)..."
kubectl apply -f /home/odp/openstack-observability/monitoring/prometheus-stack.yaml
kubectl apply -f /home/odp/openstack-observability/monitoring/openstack-exporter.yaml

# Deploy logging stack
echo "📝 2. Deploying Logging (ELK Stack)..."
kubectl apply -f /home/odp/openstack-observability/logging/elasticsearch.yaml
kubectl apply -f /home/odp/openstack-observability/logging/kibana.yaml
kubectl apply -f /home/odp/openstack-observability/logging/fluentd.yaml

# Deploy WebSSO
echo "🔐 3. Deploying WebSSO (Keycloak + Federation)..."
kubectl apply -f /home/odp/openstack-observability/websso/keycloak.yaml
kubectl apply -f /home/odp/openstack-observability/websso/keystone-federation.yaml

# Deploy alerting
echo "🚨 4. Deploying Alerting Rules..."
kubectl apply -f /home/odp/openstack-observability/alerting/openstack-alerts.yaml

echo ""
echo "⏳ Waiting for deployments to be ready..."
echo "This may take 5-10 minutes for all services to start."
echo ""
echo "📊 Monitor progress:"
echo "  kubectl get apps -n argocd | grep -E 'prometheus|elasticsearch|kibana|keycloak'"
echo "  kubectl get pods -n monitoring"
echo "  kubectl get pods -n logging"
echo "  kubectl get pods -n websso"
echo ""
echo "🌐 Access URLs (once ready):"
echo "  Grafana:  http://grafana.10.8.132.108.sslip.io (admin/admin123)"
echo "  Kibana:   http://kibana.10.8.132.108.sslip.io"
echo "  Keycloak: http://keycloak.10.8.132.108.sslip.io (admin/admin123)"
echo ""
echo "🎯 Next Steps:"
echo "1. Configure Keycloak realm and clients"
echo "2. Import Grafana dashboards"
echo "3. Set up Kibana index patterns"
echo "4. Test WebSSO integration"
echo ""
echo "✅ Observability stack deployment initiated!"
