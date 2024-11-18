# Use an official Node.js runtime as the base image
FROM node:18

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if exists)
COPY package*.json ./

# Install the application dependencies
RUN npm install

# Copy the rest of the application files to the container
COPY . .

# Set environment variable for New Relic
ENV NEW_RELIC_LICENSE_KEY=eu01xxd779cc580faa7d4c15b8367906FFFFNRAL
ENV NEW_RELIC_APP_NAME=node

# Expose port 5000 to the host
EXPOSE 5000

# Run the application when the container starts
CMD ["node", "server.js"]
