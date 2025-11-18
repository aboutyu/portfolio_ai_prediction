# Deployment Guide

이 문서는 Portfolio AI Prediction 프로젝트를 홈서버에 배포하는 방법을 설명합니다.

## 사전 요구사항

- Docker 및 Docker Compose 설치
- Git 설치
- 최소 4GB RAM (모든 서비스 실행 시)

## 빠른 배포

### 1. 저장소 클론

```bash
git clone https://github.com/aboutyu/portfolio_ai_prediction.git
cd portfolio_ai_prediction
```

### 2. 배포 실행

```bash
cd infra
./deploy.sh
```

이 스크립트는 자동으로:
- 기존 컨테이너를 중지
- 모든 서비스의 Docker 이미지 빌드
- 컨테이너 시작
- 상태 확인

### 3. 서비스 확인

배포가 완료되면 다음 URL에서 서비스에 접근할 수 있습니다:

- **Admin**: http://localhost:3001
- **API**: http://localhost:3000
- **Web**: http://localhost:3002
- **AI**: http://localhost:8000

## 수동 배포

Docker Compose를 직접 사용하려면:

```bash
cd infra

# 모든 서비스 시작
docker-compose up -d --build

# 특정 서비스만 시작
docker-compose up -d admin api

# 로그 확인
docker-compose logs -f

# 서비스 중지
docker-compose down
```

## 포트 변경

기본 포트와 충돌이 있는 경우 `infra/docker-compose.yml`에서 외부 포트를 변경할 수 있습니다:

```yaml
services:
  admin:
    ports:
      - "새포트:3001"  # 예: "8001:3001"
```

## 환경 변수 설정

프로덕션 환경에서는 `.env` 파일을 생성하여 환경 변수를 관리하는 것이 좋습니다:

```bash
cd infra
cat > .env << EOF
# Admin Service
ADMIN_PORT=3001

# API Service
API_PORT=3000

# Web Service
WEB_PORT=3002
NEXT_PUBLIC_API_URL=http://localhost:3000

# AI Service
AI_PORT=8000
DJANGO_SECRET_KEY=your-secret-key-here
DEBUG=False
EOF
```

그런 다음 `docker-compose.yml`을 수정하여 `.env` 파일을 사용하도록 설정할 수 있습니다.

## 문제 해결

### 컨테이너가 시작되지 않는 경우

```bash
# 로그 확인
docker-compose logs admin
docker-compose logs api
docker-compose logs web
docker-compose logs ai

# 컨테이너 재시작
docker-compose restart admin
```

### 빌드 캐시 문제

```bash
# 캐시 없이 다시 빌드
docker-compose build --no-cache
docker-compose up -d
```

### 포트 충돌

```bash
# 사용 중인 포트 확인
sudo netstat -tlnp | grep :3000
sudo lsof -i :3000

# 프로세스 종료
sudo kill -9 <PID>
```

### 볼륨 문제

```bash
# 모든 컨테이너와 볼륨 삭제
docker-compose down -v

# 다시 시작
docker-compose up -d --build
```

## 모니터링

### 실행 중인 컨테이너 확인

```bash
docker-compose ps
```

### 리소스 사용량 확인

```bash
docker stats
```

### 로그 실시간 확인

```bash
# 모든 서비스
docker-compose logs -f

# 특정 서비스
docker-compose logs -f api
```

## 업데이트

새 버전을 배포하려면:

```bash
cd portfolio_ai_prediction
git pull origin main

cd infra
./deploy.sh
```

## 백업

### 데이터베이스 백업 (AI 서비스)

```bash
docker-compose exec ai python manage.py dumpdata > backup.json
```

### 전체 볼륨 백업

```bash
docker-compose down
tar -czf backup.tar.gz /var/lib/docker/volumes/
docker-compose up -d
```

## 보안 권장사항

1. **SECRET_KEY 변경**: Django의 SECRET_KEY를 프로덕션 환경에 맞게 변경하세요.
2. **DEBUG 비활성화**: 프로덕션에서는 DEBUG=False로 설정하세요.
3. **ALLOWED_HOSTS 설정**: Django의 ALLOWED_HOSTS를 특정 도메인으로 제한하세요.
4. **방화벽 설정**: 필요한 포트만 외부에 노출하세요.
5. **HTTPS 설정**: 프로덕션에서는 HTTPS를 사용하세요 (nginx + Let's Encrypt).

## 성능 최적화

### 리소스 제한 설정

`docker-compose.yml`에 리소스 제한을 추가할 수 있습니다:

```yaml
services:
  admin:
    deploy:
      resources:
        limits:
          cpus: '0.5'
          memory: 512M
        reservations:
          cpus: '0.25'
          memory: 256M
```

### 프로덕션 빌드 최적화

각 서비스의 Dockerfile에서 멀티스테이지 빌드를 사용하여 이미지 크기를 줄일 수 있습니다.

## 지원

문제가 발생하면 GitHub Issues에 보고해 주세요.
