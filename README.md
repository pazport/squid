This is running the latest squid proxy. allowing all ports to pass. 

Deployment.

``docker run -d -p 3100:3128 -e PGID=1000 -e PUID=1000 --name squid man1234/squid-proxy:tagname``

``Tagname
latest = Alpine``

After you have deployed the container. on any app. that you wish to run this proxy on. you just need to add ENV on the container using

``https_proxy http://publicipofsquidcontainer:3100``

You can of course change the port you wish to use. E.G ``3111:3128``
