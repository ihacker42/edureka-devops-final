#!/bin/bash
set -e

# Start PHP-FPM
service php-fpm start

# Start Nginx
exec nginx -g 'daemon off;'
