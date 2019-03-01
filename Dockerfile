FROM alpine:3.5

RUN apk add --update nodejs bash apache2-utils

ENV APP_DIR /app
ENV NODE_ENV production

WORKDIR ${APP_DIR}

COPY src/package.json ${APP_DIR}/
RUN npm install

COPY src/locales/ ${APP_DIR}/locales/
COPY src/public/ ${APP_DIR}/public/
COPY src/routes/ ${APP_DIR}/routes/
COPY src/views/ ${APP_DIR}/views/
COPY src/config/ ${APP_DIR}/config/
COPY src/app.js ${APP_DIR}/

#VOLUME ${APP_DIR}/data

RUN ln -s ${APP_DIR}/data ${APP_DIR}/public/.db


WORKDIR /

ADD docker_root /

EXPOSE 3000

ENTRYPOINT [ "/entrypoint.sh" ]
