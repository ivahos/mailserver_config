#!/bin/sh
docker run -d -p 443:9443 -p 8000:8000 --name portainer --restart always \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v portainer_data:/data \
	-v /etc/ssl/letsencrypt:/etc/ssl/letsencrypt:ro \
	-v /etc/ssl/letsencrypt/live/helm.ih36.net:/certs/live/helm.ih36.net:ro \
	portainer/portainer-ce:latest \
	--sslcert /certs/live/helm.ih36.net/fullchain.pem \
	--sslkey /certs/live/helm.ih36.net/privkey.pem
