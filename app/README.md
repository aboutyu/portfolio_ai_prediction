# app

A new Flutter project.

## Getting Started

본 프로젝트를 실행하기 위해서는 `.env` 환경 구성이 필요합니다.

### 빌드러너 실행 명령어

```bash
dart run build_runner build -d
```

### 빌드러너 watch 명령어

```bash
flutter pub run build_runner watch -d
```

### 빌드러너 클린 명령어

```bash
dart run build_runner clean
```

### 빌드러너 충돌 해결 명령어

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 다국어 추가 시 명령어

```bash
flutter pub get
```

### 안드로이드 로컬 환경 실행 시 localhost 인식되도록 설정

```bash
adb reverse tcp:3000 tcp:3000
```

### 오픈소스라이브러리 라이선스 갱신(생성)

```bash
dart run dart_pubspec_licenses:generate -o assets/licenses.json --json
```

### 스플래시 갱신

```bash
dart run flutter_native_splash:create
```
