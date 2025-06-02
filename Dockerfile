# Build stage - use node slim for better compatibility
FROM node:18-slim AS build

WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --production

# Copy app source code
COPY . .

# Final stage - smaller alpine image to run the app
FROM node:18-alpine

WORKDIR /app

# Copy only node_modules and app from build stage
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app .

# Expose port and start app
EXPOSE 3000
CMD ["node", "index.js"]
