FROM xmppxsf/registry-base:latest as build

ARG NCORES=1
ARG TARGETS="validate build"

COPY *.xml *.xsl reg.dtd reg.ent Makefile /src/

WORKDIR /src
RUN OUTDIR=/var/www/html/registrar/ make -j$NCORES $TARGETS

FROM nginx:1-alpine
COPY --from=build /var/www/html/registrar/ /usr/share/nginx/html/registar/
RUN sed -ri '/root\s+\/usr\/share\/nginx\/html/s/^(.+)$/\1\nautoindex on;/' /etc/nginx/conf.d/default.conf

EXPOSE 80
