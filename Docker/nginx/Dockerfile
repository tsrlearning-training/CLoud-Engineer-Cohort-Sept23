FROM nginx:1.25.4-alpine
COPY nginx.conf /etc/nginx/nginx.conf
RUN  mkdir -p /var/www/html/
COPY site.html/ .
EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]