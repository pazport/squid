# Use the official Ubuntu image as a base
FROM ubuntu:20.04

# Update package lists and install Squid
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y squid \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

#copy squid.conf file
COPY squid.conf /etc/squid/
# Expose Squid port
EXPOSE 3128

# Start Squid in the foreground
CMD ["squid", "-f", "/etc/squid/squid.conf", "-NYCd", "1"]
