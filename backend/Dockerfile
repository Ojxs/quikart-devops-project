# Use an official Node.js image as the base
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
# We do this first to leverage Docker's caching, which speeds up builds
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on (must match the port in server.js)
EXPOSE 5000

# Define the command to run the application
CMD ["npm", "start"]