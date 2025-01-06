# Use the official Alpine image as a base
FROM alpine:latest

# Update package lists and install Squid
RUN apk --update add squid && rm -rf /var/cache/apk/*

# Copy squid.conf file
COPY squid.conf /etc/squid/squid.conf

# Create Squid log directory and set permissions
RUN mkdir -p /var/log/squid && \
    touch /var/log/squid/access.log && \
    chown -R squid:squid /var/log/squid && \
    chmod -R 755 /var/log/squid

# Create spool folder for squid
RUN mkdir -p /var/spool/squid && \
    chmod -R 775 /var/spool/squid && \
    chown -R squid:squid /var/spool/squid

    # Create Squid log directory and set permissions
RUN touch /etc/squid/access.log \
&& chown -R squid:squid /etc/squid/access.log \
&& chmod -R 755 /etc/squid/access.log
# Expose Squid port
EXPOSE 3128

# Copy the entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Make entrypoint script executable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
