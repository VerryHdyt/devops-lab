# Docker Fundamentals

This module introduces container images, containers, ports, bind mounts, and basic service lifecycle management.

## Nginx example

Build and run the sample static site from the repository root:

```bash
docker build -t devops-lab-nginx:local ./docker/nginx
docker run --rm --name devops-lab-web -p 8080:80 devops-lab-nginx:local
```

Open `http://localhost:8080` in your browser. Stop the container with `Ctrl+C`.

## What to learn
- Difference between an image and a container.
- Port publishing (`8080:80`).
- Reading container logs and inspecting running containers.
- Rebuilding an image after changing static content.

Only use trusted base images and avoid putting secrets in image layers.