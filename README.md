본 사이드프로젝트는 머신러닝 모델을 웹에서 구현할 수 있는 포트폴리오 용 프로젝트입니다(개발팀장 및 TPM 지원용).

# Full-stack Multi-service Platform (Monorepo)

## 🚀 프로젝트 개요

이 프로젝트는 **웹·모바일·백엔드·AI 모델링·Admin 서비스** 등 여러 개의 서비스를 하나의 모노레포에서 통합 관리하는 구조로 설계되었습니다.

- **Nest.js API & Admin(include Template Engine)**
- **Next.js(react) Web**
- **Flutter Mobile App**
- **Django 기반 AI 모델 서버**
- **Docker 기반 배포 자동화**
- **GitHub Actions 기반 CI/CD 파이프라인**

> 목표: 실제 기업 수준의 “기획 → 개발 → 배포 → 운영” 풀사이클을 재현하는 사이드 프로젝트

---

## 🏗️ 전체 아키텍처

```text
             ┌──────────────────────────┐
             │        Web (Next.js)     │
             └───────────▲──────────────┘
                         │
             ┌───────────┴──────────────┐
             │        API (Nest.js)     │
             └───▲──────────────────┬───┘
                 │                  │
     ┌───────────┴──────────┐   ┌───┴────────────┐
     │  Admin Panel (Nest)  │   │ AI Service     │
     │                      │   │ (Django/DRF)   │
     └───────────▲──────────┘   └───────▲────────┘
                 │                      │
                 ├────────────┐         │
                 │ Mobile App │         │
                 │ (Flutter)  │         │
                 └────────────┘         │
                         ┌──────────────┘
                         ▼
                PostgreSQL / Redis in docker
```

## 📁 폴더 구조

```text
repo-root/
    admin/          # Nest.js admin frontend or backend
    api/            # Nest.js backend API
    web/            # Next.js/React webapp
    ai/             # Django/DRF 기반 AI 모델 서버
    app/            # Flutter 모바일 앱
    infra/
       docker/       # Dockerfile 모음
       scripts/      # 배포 스크립트 (deploy.sh 등)
       docker-compose.yml
    README.md
    LICENSE
```

## 🧪 로컬 개발 방법

API

```cmd
cd api
npm install
npm run start:dev
```

Web

```cmd
cd web
npm install
npm run dev
```

Admin

```cmd
cd admin
npm install
npm run start:dev
```

AI

```cmd
cd ai
pip install -r requirements.txt
python manage.py runserver
```

Flutter

```cmd
cd app
flutter pub get
flutter run
```

Docker 기반 전체 서비스 실행

```cmd
cd infra
docker-compose up -d
```

## 🌐 배포 환경 구성

- Ubuntu 24.04.2
- Docker + docker-compose
- Mysql 8.0.43
- Nginx Reverse Proxy

## 📌 CHANGE LOG
