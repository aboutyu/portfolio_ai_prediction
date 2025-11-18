# portfolio_ai_prediction

머신러닝 모델을 웹에서 구현할 수 있는 포트폴리오(개발팀장 및 TPM 지원용)

## 프로젝트 구조

```
repo-root/
  admin/         # Nest.js (Admin FE or 관리용)
  api/           # Nest.js (Backend API)
  web/           # Next.js/React
  ai/            # Django/DRF (AI 서비스)
  app/           # Flutter (Android/iOS)
  infra/
    docker/
      admin/Dockerfile
      api/Dockerfile
      web/Dockerfile
      ai/Dockerfile
    docker-compose.yml
    deploy.sh    # 홈서버에서 실행할 스크립트
```

## 서비스 구성

### Admin Service (포트: 3001)
- **기술 스택**: Nest.js, TypeScript
- **설명**: 관리용 웹 애플리케이션
- **위치**: `admin/`
- **README**: [admin/README.md](admin/README.md)

### API Service (포트: 3000)
- **기술 스택**: Nest.js, TypeScript
- **설명**: 백엔드 API 서비스
- **위치**: `api/`
- **README**: [api/README.md](api/README.md)

### Web Service (포트: 3002)
- **기술 스택**: Next.js, React, TypeScript, Tailwind CSS
- **설명**: 프론트엔드 웹 애플리케이션
- **위치**: `web/`
- **README**: [web/README.md](web/README.md)

### AI Service (포트: 8000)
- **기술 스택**: Django, Django REST Framework, Python
- **설명**: AI/ML 모델 서빙 서비스
- **위치**: `ai/`
- **README**: [ai/README.md](ai/README.md)

### App (Flutter)
- **기술 스택**: Flutter, Dart
- **설명**: 모바일 애플리케이션 (Android/iOS)
- **위치**: `app/`
- **README**: [app/README.md](app/README.md)

## 빠른 시작

### 로컬 개발

각 서비스는 독립적으로 실행할 수 있습니다:

```bash
# Admin Service
cd admin && npm install && npm run start:dev

# API Service
cd api && npm install && npm run start:dev

# Web Service
cd web && npm install && npm run dev

# AI Service
cd ai && python3 -m venv venv && source venv/bin/activate && pip install -r requirements.txt && python manage.py runserver
```

### Docker를 사용한 배포

모든 서비스를 Docker Compose로 한 번에 실행:

```bash
cd infra
docker-compose up -d --build
```

또는 배포 스크립트 사용:

```bash
cd infra
./deploy.sh
```

## 서비스 접속

- **Admin**: http://localhost:3001
- **API**: http://localhost:3000
- **Web**: http://localhost:3002
- **AI**: http://localhost:8000

## 개발 환경 요구사항

- **Node.js**: 20.x 이상
- **Python**: 3.11 이상
- **Flutter**: 3.0 이상 (모바일 앱 개발 시)
- **Docker**: 최신 버전 (Docker Compose 포함)

## 배포

홈서버에 배포하려면:

1. 저장소 클론
2. `infra` 디렉토리로 이동
3. `./deploy.sh` 실행

스크립트는 자동으로:
- 기존 컨테이너 중지
- 새 이미지 빌드
- 서비스 시작
- 상태 확인

## 기술 스택 요약

| 서비스 | 프레임워크 | 언어 | 포트 |
|--------|-----------|------|------|
| Admin  | Nest.js   | TypeScript | 3001 |
| API    | Nest.js   | TypeScript | 3000 |
| Web    | Next.js   | TypeScript | 3002 |
| AI     | Django    | Python | 8000 |
| App    | Flutter   | Dart | - |

## 라이선스

ISC

