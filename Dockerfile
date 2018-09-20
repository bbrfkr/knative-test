FROM docker.io/node:10.10.0-alpine

RUN apk add git && git clone https://github.com/bbrfkr/Node.js-Chat
RUN cd Node.js-Chat && npm install

EXPOSE 8080
CMD ["node", "/Node.js-Chat/server.js"]

