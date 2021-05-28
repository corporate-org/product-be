# Base the image on the node base image
FROM node:lts-alpine3.13

# Define container where the app will be placed
WORKDIR /usr/src/app

# Play nicely with caching
# node ependancies are defined in package.json and package-log.json 
COPY package*.json ./
RUN npm install --only=prod

COPY . .

# Define which port should be exposed on the container
EXPOSE 8080

ENTRYPOINT ["/bin/sh", "./docker-entrypoint.sh"]

# The command to run when the container starts
CMD [ "node", "./bin/www" ]
