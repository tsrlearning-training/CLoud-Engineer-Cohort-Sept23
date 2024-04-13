FROM nginx:1.25.4-alpine

# Copy the custom Nginx config if necessary
COPY nginx.conf /etc/nginx/nginx.conf

# Create the directory where Nginx expects files, if not already present
RUN mkdir -p /usr/share/nginx/html

# Copy the site.html into the correct directory
COPY site.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Command to run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
