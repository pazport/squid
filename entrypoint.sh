#!/bin/sh

# Check if Squid is already running and kill it if necessary
if pgrep squid > /dev/null; then
    echo "Squid is already running. Stopping it..."
    pkill squid
    sleep 5  # Wait for Squid to stop completely

    # Ensure Squid has stopped
    if pgrep squid > /dev/null; then
        echo "Squid did not stop, forcefully killing it..."
        pkill -9 squid
    fi
fi

# Remove PID file if it exists
if [ -f /var/run/squid.pid ]; then
    echo "Removing stale PID file..."
    rm -f /var/run/squid.pid
fi

# Start Squid in the foreground without caching
echo "Starting Squid without caching..."
squid -N -f /etc/squid/squid.conf -Y -C -d 1 &

# Tail access log
tail -f /etc/squid/access.log