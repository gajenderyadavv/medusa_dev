FROM node:18

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install --frozen-lockfile

RUN yarn install --force && npm rebuild @swc/core --build-from-source

COPY . .

ENV NODE_ENV=production \
    ADMIN_CORS=http://localhost:7000,http://localhost:7001 \
    STORE_CORS=http://localhost:8000 \
    DATABASE_URL=postgres://postgres:postgres@database-1.c16860ec6zm5.ap-south-2.rds.amazonaws.com:5432/postgres \
    JWT_SECRET=supersecret \
    COOKIE_SECRET=supersecret

EXPOSE 9000 7000 7001

CMD ["yarn", "dev"]