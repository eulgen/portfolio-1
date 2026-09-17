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

# Built-in container healthcheck
HEALTHCHECK --interval=15s --timeout=5s --start-period=10s --retries=3 \
  CMD node -e "fetch('http://localhost:3000/').then(r=>r.ok?process.exit(0):process.exit(1)).catch(()=>process.exit(1))"

# Run the Node.js server directly
CMD ["node", ".output/server/index.mjs"]
