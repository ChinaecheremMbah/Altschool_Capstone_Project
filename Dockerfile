# Use an official node runtime as a parent image
FROM node:14

# Set the working directory
WORKDIR /mnt/c/Users/chi isiaki/Desktop/Altschool_capstone_project/microservices-demo.github.io

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 8080

# Define the command to run the app
CMD [ "node", "server.js" ]
