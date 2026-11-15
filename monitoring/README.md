# Monitoring and Logging

Monitoring helps answer whether a service is healthy and how it behaves over time. Logging records events that help explain what happened.

## Starter checks
- Host resources: `linux/scripts/system-info.sh`
- Filesystem capacity: `linux/scripts/disk-monitor.sh`
- Container state: `docker ps`
- Container output: `docker logs <container-name>`

## Key concepts
- **Availability:** can users reach the service?
- **Latency:** how long do requests take?
- **Traffic:** how much work is the service handling?
- **Errors:** how often do requests fail?
- **Saturation:** how close are resources to their limits?

Future labs can add Prometheus, Grafana, and alerting after the fundamentals are understood. Do not expose monitoring dashboards publicly without authentication and network controls.