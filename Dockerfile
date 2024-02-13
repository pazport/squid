# Use the official Alpine image as a base
FROM alpine:latest

# Update package lists and install Squid
RUN apk --update add squid && rm -rf /var/cache/apk/*

# Copy squid.conf file
COPY squid.conf /etc/squid/squid.conf

#make spool folder for squid
RUN mkdir /var/spool/squid
# Expose Squid port
EXPOSE 3128

# Start Squid in the foreground
CMD ["squid", "-f", "/etc/squid/squid.conf", "-NYCd", "1"]
