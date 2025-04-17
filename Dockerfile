# Step 1: Build the React app
FROM node:18 AS build

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Step 2: Serve the app using Nginx (or directly on port 3000 for development)
FROM node:18 AS serve
WORKDIR /app
COPY --from=build /app /app

# Expose port 3000 for the React app in development
EXPOSE 3000
CMD ["npm", "start"]

