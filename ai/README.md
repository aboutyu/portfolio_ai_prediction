# AI Service

Django/Django REST Framework 기반 AI 서비스입니다.

## 설치 및 실행

```bash
# 가상환경 생성
python3 -m venv venv

# 가상환경 활성화
source venv/bin/activate  # Linux/Mac
# venv\Scripts\activate  # Windows

# 의존성 설치
pip install -r requirements.txt

# 마이그레이션
python manage.py migrate

# 개발 서버 실행
python manage.py runserver 0.0.0.0:8000
```

## 포트

- 개발/프로덕션: 8000

## API 엔드포인트

- `GET /api/` - Hello 메시지
- `GET /api/health` - 헬스 체크

## 기능

- Django REST Framework
- CORS 활성화
- Admin 패널 (/admin/)

## 환경 변수

- `DEBUG` - 디버그 모드 (기본값: True)
- `DJANGO_SETTINGS_MODULE` - Django 설정 모듈 (기본값: config.settings)
