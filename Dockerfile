# Use the devopsedu/webapp as the base image
FROM devopsedu/webapp

# Set the working directory
WORKDIR /var/www/html

# Update package lists and install Nginx
RUN apt-get update \
    && apt-get install -y nginx \
    && rm -rf /var/lib/apt/lists/*

# Copy the current directory contents into the container at /var/www/html
COPY ./website /var/www/html

# Set permissions for the web server to read and write files
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Remove the default Nginx configuration file
RUN rm /etc/nginx/sites-enabled/default

# Copy your custom Nginx configuration file
COPY nginx.conf /etc/nginx/sites-enabled/default

# Expose port 80 for the web server
EXPOSE 80

# Start the Nginx server
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh
CMD ["start.sh"]
