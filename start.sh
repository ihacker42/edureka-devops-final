#!/bin/bash
set -e

# Find the correct PHP version installed
PHP_VERSION=$(php -r "echo PHP_MAJOR_VERSION.'.'.PHP_MINOR_VERSION;")

# Start PHP-FPM
service php${PHP_VERSION}-fpm start

# Start Nginx
exec nginx -g 'daemon off;'
