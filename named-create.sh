#!/bin/sh
docker run -dit --name mydns -p 53:53/tcp -p 53:53/udp -p 953:953/udp -p 953:943/tcp --restart=unless-stopped -h mydns -e TZ=Australia/Sydney\
	-v /home/ivar/bind9/etc/:/etc/bind:rw\
	-v /home/ivar/bind9/var/:/var/named:rw\
	-v /home/ivar/bind9/tools/zedit:/usr/bin/zedit:ro\
	ubuntu/bind9
