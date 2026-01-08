########################################
# 1단계: 빌드 전용 컨테이너 (Builder)
########################################

# Node.js 20 LTS + alpine (가볍고 안정적)
FROM node:20-alpine AS builder

# 컨테이너 내부 작업 디렉토리 설정
WORKDIR /app

# 의존성 정의 파일만 먼저 복사
# → 소스 코드 변경 시 매번 npm install 안 하도록 캐시 최적화
COPY package*.json ./

# package-lock.json 기준으로 정확하게 의존성 설치
# CI / Docker 환경에서 가장 안전한 방식
RUN npm ci

# 전체 소스 코드 복사
COPY . .

# NestJS 빌드
# (TypeScript → JavaScript, dist/ 생성)
RUN npm run build


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
ENV NODE_ENV=development

# 빌드 결과물만 복사
# → TypeScript, nest-cli 등 불필요한 파일 제외
COPY --from=builder /app/dist ./dist

# 런타임에 필요한 node_modules만 복사
# (현재는 devDependencies 포함 상태)
COPY --from=builder /app/node_modules ./node_modules

# package.json 복사
# (일부 라이브러리에서 metadata 용도로 필요)
COPY --from=builder /app/package.json ./package.json

# 컨테이너가 사용할 포트 (문서용)
# 실제 외부 노출은 docker-compose에서 설정
EXPOSE 3000

# NestJS 서버 실행
# pm2 없이 Docker가 프로세스를 직접 관리
CMD ["node", "dist/main.js"]
