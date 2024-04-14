# Use Node.js LTS as base image
FROM node:14 AS build

# Set working directory
WORKDIR /app/client

# Copy package.json and package-lock.json
COPY client/package*.json ./

# Install dependencies
RUN npm install

# Copy all files
COPY client/ ./

# Build the React app
RUN npm run build

# Use Nginx to serve the React app
FROM nginx:alpine

# Copy built files from build stage
COPY --from=build /app/client/build /usr/share/nginx/html

# Expose port
EXPOSE 80

# Command to run Nginx
CMD ["nginx", "-g", "daemon off;"]
