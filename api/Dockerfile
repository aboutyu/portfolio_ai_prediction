########################################
# 1단계: 빌드 전용 컨테이너 (Builder)
########################################

# Node.js 20 LTS + alpine (가볍고 안정적)
FROM node:20-alpine AS builder

# 컨테이너 내부 작업 디렉토리 설정
WORKDIR /app

# 빌드 시점에도 production임을 명시 (Tree Shaking 최적화)
ARG TARGET_ENV=production
ENV NODE_ENV=${TARGET_ENV}

# 의존성 정의 파일만 먼저 복사
# → 소스 코드 변경 시 매번 npm install 안 하도록 캐시 최적화
COPY package*.json ./

# package-lock.json 기준으로 정확하게 의존성 설치
# CI / Docker 환경에서 가장 안전한 방식
RUN npm ci

# 전체 소스 코드 복사
COPY . .

# NestJS 빌드
RUN if [ "$TARGET_ENV" = "production" ]; \
    then npm run build:prod; \
    else npm run build:dev; \
    fi


########################################
# 2단계: 실제 실행 컨테이너 (Runner)
########################################

# 빌드 단계와 동일한 Node 버전 사용
# (버전 불일치로 인한 런타임 오류 방지)
FROM node:20-alpine

# 컨테이너 내부 작업 디렉토리
WORKDIR /app

# 현재 컨테이너가 개발 환경임을 명시
# NestJS, 라이브러리들이 이 값을 기준으로 동작
ARG TARGET_ENV=production
ENV NODE_ENV=${TARGET_ENV}

COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json

EXPOSE 3000

# [핵심] 실행 시점에도 환경에 맞는 스크립트 실행
# CMD 문구는 고정하고 내부에서 NODE_ENV를 참조하게 하거나, 
# 아래처럼 쉘 형태로 작성하여 분기할 수 있습니다.
CMD ["sh", "-c", "if [ \"$NODE_ENV\" = \"production\" ]; then node dist/main.js; else npm run start:dev; fi"]
