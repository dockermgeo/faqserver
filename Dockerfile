FROM alpine:3.5 as base

RUN apk add --update nodejs bash apache2-utils

ENV APP_DIR /app
ENV NODE_ENV production

WORKDIR ${APP_DIR}
COPY src/package.json ${APP_DIR}/
RUN npm install


FROM base
WORKDIR /

COPY src/ ${APP_DIR}/
ADD docker_root /

VOLUME ${APP_DIR}/data

RUN ln -s ${APP_DIR}/data ${APP_DIR}/public/.db

EXPOSE 3000

ENTRYPOINT [ "/entrypoint.sh" ]
