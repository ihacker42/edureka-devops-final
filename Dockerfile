# Use the devopsedu/webapp as the base image
FROM devopsedu/webapp

# Set the working directory
WORKDIR /var/www/html

# Update package lists and install Apache
RUN apt-get update \
    && apt-get install -y apache2 \
    && rm -rf /var/lib/apt/lists/*

# Copy the current directory contents into the container at /var/www/html
COPY ./website /var/www/html

# Set permissions for the web server to read and write files
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Expose port 80 for the web server
EXPOSE 80

# Start the Apache server
CMD ["apache2-foreground"]
