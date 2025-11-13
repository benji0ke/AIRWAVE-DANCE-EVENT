# Use lightweight Nginx web server
FROM nginx:alpine

# Copy all static site files into Nginx's default web directory
COPY . /usr/share/nginx/html

# Expose port 80 inside the container
EXPOSE 80

