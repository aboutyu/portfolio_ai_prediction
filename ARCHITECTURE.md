# Architecture Overview

## System Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                     Portfolio AI Prediction                      │
│                         Monorepo Structure                        │
└─────────────────────────────────────────────────────────────────┘

┌──────────────┐  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐
│    Admin     │  │     API      │  │     Web      │  │      AI      │
│  (Nest.js)   │  │  (Nest.js)   │  │  (Next.js)   │  │   (Django)   │
│   Port 3001  │  │   Port 3000  │  │   Port 3002  │  │   Port 8000  │
└──────┬───────┘  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘
       │                  │                  │                  │
       └──────────────────┴──────────────────┴──────────────────┘
                                  │
                          ┌───────▼────────┐
                          │ Docker Network │
                          │ portfolio-net  │
                          └────────────────┘
```

## Service Details

### Admin Service (관리용)
- **Technology**: Nest.js + TypeScript
- **Port**: 3001
- **Purpose**: 관리자 인터페이스
- **Endpoints**:
  - `GET /` - Hello message
  - `GET /health` - Health check

### API Service (백엔드)
- **Technology**: Nest.js + TypeScript
- **Port**: 3000
- **Purpose**: 메인 백엔드 API
- **Features**:
  - CORS enabled
  - RESTful API
- **Endpoints**:
  - `GET /` - Hello message
  - `GET /health` - Health check

### Web Service (프론트엔드)
- **Technology**: Next.js + React + TypeScript + Tailwind CSS
- **Port**: 3002
- **Purpose**: 사용자 웹 인터페이스
- **Features**:
  - Server-side rendering
  - Static optimization
  - Standalone output for Docker

### AI Service (AI/ML)
- **Technology**: Django + Django REST Framework + Python
- **Port**: 8000
- **Purpose**: AI/ML 모델 서빙
- **Features**:
  - REST API
  - CORS enabled
  - Admin panel
- **Endpoints**:
  - `GET /api/` - Hello message
  - `GET /api/health` - Health check
  - `GET /admin/` - Django admin panel

### App (모바일)
- **Technology**: Flutter + Dart
- **Platforms**: Android, iOS
- **Purpose**: 모바일 애플리케이션

## Infrastructure

### Docker Setup
```
infra/
├── docker/
│   ├── admin/Dockerfile    # Admin service container
│   ├── api/Dockerfile      # API service container
│   ├── web/Dockerfile      # Web service container
│   └── ai/Dockerfile       # AI service container
├── docker-compose.yml      # Orchestration configuration
└── deploy.sh              # Automated deployment script
```

### Network Configuration
- All services run in isolated `portfolio-network` bridge network
- Services can communicate using service names (e.g., `http://api:3000`)
- External access via mapped ports

## Data Flow

```
User (Browser/Mobile)
    │
    ├─→ Web (Next.js:3002)
    │      │
    │      ├─→ API (Nest.js:3000)
    │      │      │
    │      │      └─→ AI (Django:8000)
    │      │
    │      └─→ Admin (Nest.js:3001)
    │
    └─→ App (Flutter Mobile)
           │
           └─→ API (Nest.js:3000)
                  │
                  └─→ AI (Django:8000)
```

## Deployment Flow

```
1. Source Code
   │
   ├─→ Git Repository
   │
2. Build Process
   │
   ├─→ Docker Build
   │   ├─→ admin:latest
   │   ├─→ api:latest
   │   ├─→ web:latest
   │   └─→ ai:latest
   │
3. Deploy
   │
   ├─→ docker-compose up -d
   │
4. Running Services
   │
   ├─→ Admin Container (3001)
   ├─→ API Container (3000)
   ├─→ Web Container (3002)
   └─→ AI Container (8000)
```

## Technology Stack Summary

| Component | Framework | Language | Runtime | Port |
|-----------|-----------|----------|---------|------|
| Admin     | Nest.js   | TypeScript | Node.js 20 | 3001 |
| API       | Nest.js   | TypeScript | Node.js 20 | 3000 |
| Web       | Next.js   | TypeScript | Node.js 20 | 3002 |
| AI        | Django    | Python | Python 3.11 | 8000 |
| App       | Flutter   | Dart | Flutter SDK | - |

## Development vs Production

### Development
- Each service runs independently
- Hot reload enabled
- Debug mode on
- Local databases

### Production (Docker)
- All services containerized
- Optimized builds
- Debug mode off
- Persistent volumes for data
- Automated deployment via `deploy.sh`

## Security Considerations

- CORS configured for cross-origin requests
- Environment-based configuration
- Secret management via environment variables
- Container isolation
- Network segmentation

## Scalability

The architecture supports:
- Horizontal scaling of individual services
- Load balancing (requires additional configuration)
- Microservices architecture
- Independent deployment of services
- Database scaling (requires additional configuration)

## Monitoring & Logging

Use Docker commands:
```bash
# View logs
docker-compose logs -f [service-name]

# Check status
docker-compose ps

# Resource usage
docker stats
```

## Future Enhancements

- [ ] Add Nginx reverse proxy
- [ ] Implement SSL/TLS (HTTPS)
- [ ] Add Redis for caching
- [ ] Add PostgreSQL/MySQL for production database
- [ ] Implement CI/CD pipeline
- [ ] Add monitoring (Prometheus, Grafana)
- [ ] Add log aggregation (ELK stack)
- [ ] Kubernetes deployment configuration
