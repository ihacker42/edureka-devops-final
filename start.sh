#!/bin/bash
set -e
# Start Apache
exec apache2 -D FOREGROUND
