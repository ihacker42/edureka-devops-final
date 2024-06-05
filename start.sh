#!/bin/bash
set -e

# Start PHP-FPM
service php7.4-fpm start || service php8.1-fpm start || service php-fpm start

# Start Nginx
exec nginx -g 'daemon off;'
