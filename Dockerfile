
# Stage 1: Build
FROM node:latest AS build

WORKDIR /app

# Copy package files and install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Next.js app
RUN npm run build

# Stage 2: Run
FROM node:latest

WORKDIR /app

# Copy built files from build stage
COPY --from=build /app/.next ./.next
COPY --from=build /app/public ./public
COPY --from=build /app/package.json ./package.json

# Install production dependencies
RUN npm install --omit=dev

# Expose port and start the server
EXPOSE 3000
CMD ["npm", "run", "start"]



