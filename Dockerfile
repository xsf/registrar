FROM alpine:edge
MAINTAINER Sam Whited <sam@samwhited.com>

RUN apk update && apk upgrade
RUN apk add make nginx libxml2-utils libxslt

# Build and copy in place.
WORKDIR /usr/local/src/registrar
COPY . /usr/local/src/registrar
RUN cd /usr/local/src/registrar && make all

FROM nginx:alpine
COPY deploy/registrar.conf /etc/nginx/conf.d/default.conf
COPY --from=0 /usr/local/src/registrar/registrar /var/www/registrar/
