FROM node:22

# Create app directory
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm ci --only=production

# Copy app source
COPY . .

# Set environment variables (these will be overridden at runtime)
ENV SLACK_BOT_TOKEN=""
ENV SLACK_APP_TOKEN=""
ENV OPENAI_API_KEY=""
ENV NODE_ENV="production"

# Start the application
CMD ["npm", "start"] 