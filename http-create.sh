#!/bin/sh
docker run -dit --name webserver -p 80:80 -p 443:443 --restart=unless-stopped \
		-v /home/ivar/website:/usr/local/apache2/htdocs/ \
		-v /etc/ssl/letsencrypt/live/mta-sts.supermail.au/fullchain.pem:/usr/local/apache2/conf/server.crt:ro \
		-v /etc/ssl/letsencrypt/live/mta-sts.supermail.au/privkey.pem:/usr/local/apache2/conf/server.key:ro \
		-v /home/ivar/mailserver/my-httpd.conf:/usr/local/apache2/conf/httpd.conf:ro \
		-v /home/ivar/mailserver/my-httpd-ssl.conf:/usr/local/apache2/conf/extra/httpd-ssl.conf:ro \
		httpd:latest
