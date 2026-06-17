FROM node:20-alpine AS base
WORKDIR /app
COPY package.json package-lock.json ./

FROM base AS dev
RUN npm ci
COPY . ./
RUN npm run build

FROM base AS prod 
RUN npm ci --omit=dev

FROM node:20-alpine AS runtime
WORKDIR /app

COPY package.json ./
COPY --from=prod /app/node_modules ./node_modules
COPY --from=dev /app/dist ./dist

CMD ["node", "dist/index.js"]