# Use Node.js LTS as base image
FROM node:14

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy server.js and other necessary files
COPY server.js ./

# Expose port
EXPOSE 3000

# Command to run the application
CMD ["node", "server.js"]
