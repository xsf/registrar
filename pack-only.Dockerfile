FROM nginx:1-alpine
COPY registrar/ /usr/share/nginx/html/registar/
RUN sed -ri '/root\s+\/usr\/share\/nginx\/html/s/^(.+)$/\1\nautoindex on;/' /etc/nginx/conf.d/default.conf

EXPOSE 80
