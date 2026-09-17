# Stage 1: Build stage
FROM node:24-slim AS builder

WORKDIR /app

# Install pnpm using corepack
RUN corepack enable && corepack prepare pnpm@12.3.4 --activate

# Copy package management files
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./

# Install dependencies strictly
RUN pnpm install --frozen-lockfile

# Copy application source
COPY . .

# Cache-buster to force re-running Nuxt build with node-server preset
ARG BUILD_ID=2
# Build Nuxt application with Node.js server preset
RUN pnpm run build

# Stage 2: Production Node.js server
FROM node:24-slim AS runner

WORKDIR /app

# Copy the built output (contains the standalone Node.js server)
COPY --from=builder /app/.output .output

# Nitro server listens on port 3000 by default
EXPOSE 3000

# Run the Node.js server directly
CMD ["node", ".output/server/index.mjs"]
