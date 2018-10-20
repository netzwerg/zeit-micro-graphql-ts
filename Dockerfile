FROM mhart/alpine-node:10 as base
WORKDIR /usr/src
COPY . .
RUN npm install
RUN npm run build

FROM mhart/alpine-node:base-10
WORKDIR /usr/src
ENV NODE_ENV="production"
COPY --from=base /usr/src .
CMD ["node", "./node_modules/.bin/micro"]