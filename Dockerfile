FROM node:18-alpine as base

WORKDIR /app

RUN apk update

FROM base as dev
COPY dev-entrypoint.sh .
ENTRYPOINT ["/bin/sh", "dev-entrypoint.sh"]

FROM base as prod
COPY . .
RUN yarn
RUN yarn build
CMD ["yarn", "start"]