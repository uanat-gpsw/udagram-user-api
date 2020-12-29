# Use NodeJS base image
FROM node:13

# Create app directory
WORKDIR /usr/src/app
ARG POSTGRES_USERNAME
ARG POSTGRES_PASSWORD
ARG POSTGRES_DB
ARG POSTGRES_HOST
ARG JWT_SECRET
ARG URL
ENV POSTGRES_USERNAME=${POSTGRES_USERNAME} 
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD} 
ENV POSTGRES_DB=${POSTGRES_DB} 
ENV POSTGRES_HOST=${POSTGRES_HOST}
ENV JWT_SECRET=${JWT_SECRET}
ENV URL=${URL}
# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install
RUN npm install typescript -g

# Copy app source
COPY . .
RUN tsc
# Bind the port that the image will run on
EXPOSE 8080

# Define the Docker image's behavior at runtime
CMD ["node","./www/server.js"]