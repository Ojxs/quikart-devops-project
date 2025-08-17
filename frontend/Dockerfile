# --- Stage 1: Build the React Application ---
# Use a Node.js image to build the app
FROM node:18-alpine as build-stage

# Set the working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the application source code
COPY . .

# Build the application for production
RUN npm run build

# --- Stage 2: Serve the Application with NGINX ---
# Use a lightweight NGINX image
FROM nginx:stable-alpine as production-stage

# Copy the built React app from the build stage to NGINX's web root
COPY --from=build-stage /app/build /usr/share/nginx/html

# Expose port 80 (standard HTTP port)
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]