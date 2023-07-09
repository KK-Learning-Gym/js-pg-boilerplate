FROM node:16.19.1-buster
# Create app directory
WORKDIR /usr/src/app
# Copy package.json & package-lock.json
COPY build/package*.json ./
# Only install the production dependencies
RUN npm ci --omit=dev --ignore-scripts --quiet
# Bundle app source code
COPY build .
EXPOSE 3030
CMD ["node", "-r", "dotenv/config", "src/index.js", "dotenv_config_path=.env"]