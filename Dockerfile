# Use an official Node.js runtime as the base image

FROM node:18

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if exists)
COPY package*.json ./
ENV NEW_RELIC_NO_CONFIG_FILE=true
ENV NEW_RELIC_DISTRIBUTED_TRACING_ENABLED=true
ENV NEW_RELIC_LOG=stdout
# Install the application dependencies
RUN npm install

# Copy the rest of the application files to the container
COPY . .

# Expose port 5000 to the host
EXPOSE 5000

# Run the application when the container starts
CMD ["node", "server.js"]
