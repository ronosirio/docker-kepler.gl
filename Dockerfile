FROM mhart/alpine-node:16
#FROM node:20-alpine3.18
#FROM node:14.1-alpine
#FROM node:13.10.1-alpine3.11
#FROM node:16-alpine

LABEL maintainer="Stefan Kuethe <crazycapivara@gmail.com>"

RUN apk update \
	&& apk upgrade \
	&& apk add git

RUN git clone https://github.com/uber/kepler.gl.git

WORKDIR /kepler.gl/examples/demo-app

RUN npm install

ENV PATH "$PATH:/kepler.gl/examples/demo-app/node_modules/.bin"

EXPOSE 80

CMD ["webpack-dev-server", "--progress", "--port", "80", "--host", "0.0.0.0",  "--allowed-hosts", "all"]
