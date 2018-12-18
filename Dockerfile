from node:8.14.0-alpine
RUN apk add --no-cache git
COPY . .
RUN npm install

EXPOSE 8546
CMD [ "npm", "start" ]
