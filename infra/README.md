# Infrastructure

이 디렉토리는 Docker 설정 및 배포 스크립트를 포함합니다.

## 구조

```
infra/
  docker/
    admin/Dockerfile      # Admin 서비스 Dockerfile
    api/Dockerfile        # API 서비스 Dockerfile
    web/Dockerfile        # Web 서비스 Dockerfile
    ai/Dockerfile         # AI 서비스 Dockerfile
  docker-compose.yml      # 모든 서비스를 orchestrate하는 설정
  deploy.sh               # 배포 자동화 스크립트
```

## Docker Compose 사용법

### 모든 서비스 시작

```bash
docker-compose up -d
```

### 빌드와 함께 시작

```bash
docker-compose up -d --build
```

### 특정 서비스만 시작

```bash
docker-compose up -d admin api
```

### 서비스 중지

```bash
docker-compose down
```

### 로그 확인

```bash
# 모든 서비스 로그
docker-compose logs -f

# 특정 서비스 로그
docker-compose logs -f api
```

### 서비스 상태 확인

```bash
docker-compose ps
```

## 배포 스크립트 (deploy.sh)

홈서버에서 자동 배포를 위한 스크립트입니다.

### 사용법

```bash
./deploy.sh
```

### 스크립트 기능

1. 기존 컨테이너 중지
2. 이미지 빌드
3. 서비스 시작
4. 상태 확인

## 서비스 포트

| 서비스 | 내부 포트 | 외부 포트 |
|--------|----------|----------|
| Admin  | 3001     | 3001     |
| API    | 3000     | 3000     |
| Web    | 3002     | 3002     |
| AI     | 8000     | 8000     |

## 네트워크

모든 서비스는 `portfolio-network`라는 Docker 브릿지 네트워크에서 실행됩니다.
이를 통해 서비스 간 통신이 가능합니다.

## 환경 변수

각 서비스의 환경 변수는 `docker-compose.yml`에서 설정됩니다.

필요에 따라 `.env` 파일을 생성하여 환경 변수를 관리할 수 있습니다.

## 문제 해결

### 포트 충돌

이미 사용 중인 포트가 있다면 `docker-compose.yml`에서 외부 포트를 변경하세요:

```yaml
ports:
  - "새포트:내부포트"
```

### 빌드 캐시 무효화

```bash
docker-compose build --no-cache
```

### 볼륨 정리

```bash
docker-compose down -v
```
