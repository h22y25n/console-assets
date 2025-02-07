FROM nginx:1.19

ENV PORT 80
ENV WORK_DIR /tmp
ENV ROOT_PATH /var/www/assets
ENV NGINX_CONF_PATH /etc/nginx/conf.d

RUN mkdir -p ${ROOT_PATH}
WORKDIR ${WORK_DIR}

RUN apt-get update && rm -f /etc/nginx/sites-enabled/default \
    && mkdir -p ${LOG_PATH}/nginx
RUN rm -rf /etc/nginx/conf.d/default.conf


COPY icons ${ROOT_PATH}/icons
COPY images ${ROOT_PATH}/images
COPY lottiefiles ${ROOT_PATH}/lottiefiles
COPY public ${ROOT_PATH}/

EXPOSE ${PORT}

ENTRYPOINT ["nginx", "-g", "daemon off;"]
