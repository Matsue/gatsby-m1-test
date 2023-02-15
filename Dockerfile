FROM node:18.13.0

WORKDIR /app

# We do not run yarn install to speed up installation.
# COPY package.json yarn.lock ./
# RUN yarn
