# 1. 빌드 단계 (Builder)
FROM node:20-alpine AS builder

# 작업 디렉토리 설정
WORKDIR /app

# 패키지 파일 복사 및 설치
COPY package*.json ./
# npm install 대신 ci를 사용하면 lock파일 버전 그대로 설치되어 더 안전함
RUN npm ci 

# 소스 코드 복사 및 빌드
COPY . .
RUN npm run build

# 2. 실행 단계 (Runner)
FROM node:20-alpine

WORKDIR /app

# 빌드 단계에서 생성된 실행에 필요한 파일만 복사
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json

# 환경변수 파일 복사 (필요시)
# COPY .env .env 

# 3000번 포트 노출
EXPOSE 3000

# 서버 실행
CMD ["node", "dist/main"]