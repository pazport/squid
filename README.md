This is running the latest squid proxy. allowing all ports to pass. 

* [GitHub](https://github.com/pazport/squid) - view the source for all of our repositories.

[![Docker Pulls](https://img.shields.io/docker/pulls/man1234/squid-proxy.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=pulls&logo=docker)](https://hub.docker.com/r/man1234/squid-proxy)
[![Docker Stars](https://img.shields.io/docker/stars/man1234/squid-proxy.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=stars&logo=docker)](https://hub.docker.com/r/man1234/squid-proxy)

Deployment.

``docker run -d -p 3100:3128 -e PGID=1000 -e PUID=1000 --name squid man1234/squid-proxy:tagname``

``Tagname
latest = Alpine``

After you have deployed the container. on any app. that you wish to run this proxy on. you just need to add ENV on the container using

``https_proxy http://publicipofsquidcontainer:3100``

You can of course change the port you wish to use. E.G ``3111:3128``

I will be soon adding this to github. for people that have any problems. and wish to let me know. 
