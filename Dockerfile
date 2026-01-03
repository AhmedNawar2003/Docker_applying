# BASE STAGE
FROM node:20 as base


# DEV STAGE
FROM base as development 

WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
EXPOSE 4000
CMD [ "npm","run","start-dev" ]

# PRODUCTION STAGE
FROM base as production

WORKDIR /app
COPY package.json .
RUN npm install --only=production
COPY . .
EXPOSE 4000
CMD [ "npm","start" ]