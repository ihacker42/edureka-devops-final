#!/bin/bash
set -e
# Start Apache
exec sudo apache2 -D FOREGROUND
