# OpenStack Observability Stack

Complete monitoring, logging, WebSSO, and alerting solution for your OpenStack-Helm deployment.

## Components Deployed

### 📊 Monitoring
- **Prometheus** - Metrics collection and storage (15 days retention)
- **Grafana** - Dashboards and visualization
- **OpenStack Exporter** - OpenStack-specific metrics
- **Node Exporter** - Infrastructure metrics
- **Pre-built dashboards** for OpenStack services

### 📝 Logging
- **Elasticsearch** - Log storage and indexing (3 nodes, 100GB each)
- **Kibana** - Log analysis and visualization
- **Fluentd** - Log collection from OpenStack pods
- **OpenStack log parsing** - Structured logging

### 🔐 WebSSO
- **Keycloak** - Identity provider with PostgreSQL backend
- **Keystone Federation** - OIDC integration
- **Horizon WebSSO** - Single sign-on for dashboard
- **Automated setup** - Federation configuration job

### 🚨 Alerting
- **Service health alerts** - OpenStack service monitoring
- **Performance alerts** - Response time and resource usage
- **Infrastructure alerts** - Database, message queue, storage
- **Custom thresholds** - Configurable alert rules

## Access URLs

| Service | URL | Credentials |
|---------|-----|-------------|
| Grafana | http://grafana.10.8.132.108.sslip.io | admin/admin123 |
| Kibana | http://kibana.10.8.132.108.sslip.io | - |
| Keycloak | http://keycloak.10.8.132.108.sslip.io | admin/admin123 |

## Storage Requirements

- **Prometheus**: 50GB (metrics retention)
- **Elasticsearch**: 300GB total (100GB × 3 nodes)
- **Grafana**: 10GB (dashboards and config)
- **Keycloak DB**: 20GB (user data)

## Features

✅ **Production-ready** - Persistent storage, HA configuration
✅ **OpenStack-aware** - Service-specific metrics and logs
✅ **GitOps managed** - ArgoCD applications for all components
✅ **Integrated** - Uses existing Ceph storage and ingress
✅ **Secure** - WebSSO with federation and RBAC

## Deployment

```bash
cd /home/odp/openstack-observability
./deploy-observability.sh
```

This gives you enterprise-grade observability for your OpenStack deployment!
