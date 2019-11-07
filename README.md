# docker-node-rdkafka

Docker image with embedded rdkafka node module to improve CI/CD timed build and deploy.

This dispense every c++ compilation to generate the node.js module, because it's already in global node_module folder and already linked to local node_module too.

## Obs

The node.js application needs stay on path (*WORKDIR*) **/opt/app** because the link of node-ndkafka module is generated from this path to global node_modules.

## Example your Dockerfile

```yml
FROM krotondigital/node-rdkafka:10-alpine

WORKDIR /opt/app

COPY package*.json ./

RUN npm install --production

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
```