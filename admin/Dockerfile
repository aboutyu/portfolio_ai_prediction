########################################
# 1단계: 빌드 전용 컨테이너 (Builder)
########################################
FROM node:20-alpine AS builder
WORKDIR /app

# 빌드 시점에 주입받을 변수 (기본값은 production)
ARG TARGET_ENV=production
ENV NODE_ENV=${TARGET_ENV}

COPY package*.json ./
# 개발 환경이면 모든 패키지 설치, 운영 환경이면 필수 패키지만 설치할 수도 있음
RUN npm ci --include=dev

COPY . .

# [핵심] TARGET_ENV에 따라 다른 빌드 스크립트 실행
# 만약 package.json에 build:dev, build:prod가 있다면 아래처럼 분기 가능
RUN if [ "$TARGET_ENV" = "production" ]; \
    then npm run build:prod; \
    else npm run build:dev; \
    fi

########################################
# 2단계: 실제 실행 컨테이너 (Runner)
########################################
FROM node:20-alpine
WORKDIR /app

COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json

EXPOSE 8080

# [핵심] 실행 시점에도 환경에 맞는 스크립트 실행
# CMD 문구는 고정하고 내부에서 NODE_ENV를 참조하게 하거나, 
CMD ["node", "dist/main.js"]
