#!/bin/bash
set -e

# Start PHP-FPM
service php8.1-fpm start

# Start Nginx
exec nginx -g 'daemon off;'
