FROM nginx:alpine

ENV DIR_SSL=/etc/nginx/ssl \
    LOCAL_SSL=certs

RUN mkdir $DIR_SSL

COPY default.conf /etc/nginx/conf.d/

COPY $LOCAL_SSL/nginx.key $DIR_SSL

COPY $LOCAL_SSL/nginx.crt $DIR_SSL

COPY $LOCAL_SSL/dhparam.pem $DIR_SSL

# SECURITY limit access to the certificat
RUN chmod -R 400 $DIR_SSL

CMD ["nginx", "-g", "daemon off;"]
