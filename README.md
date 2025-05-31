# 🧠👕 AI 스마트 옷장 플랫폼 - Docker Compose 설정

이 프로젝트는 AI를 활용한 스마트 옷장 플랫폼입니다. 프론트엔드, 백엔드, AI 서비스, LLM 서비스, 그리고 MySQL 데이터베이스까지 포함되어 있으며, Docker Compose를 통해 통합적으로 실행됩니다.

## 📦 구성 서비스

| 서비스 이름          | 설명                               |
| --------------- | -------------------------------- |
| **ocean-front** | 사용자 인터페이스(Frontend, Vue/React 등) |
| **ocean-back**  | 메인 애플리케이션 서버(Backend, API 서버)    |
| **ocean-ai**    | AI 기반 추천 시스템 서비스                 |
| **ocean-llm**   | LLM 기반 자연어 처리 API (Flask 기반)     |
| **ocean-db**    | MySQL 데이터베이스                     |

---

## 🚀 실행 방법

### 1. `.env` 파일 설정

루트 디렉토리에 `.env` 파일을 생성하고 아래 환경변수를 설정하세요:

```env
# 포트 설정
FRONTEND_PORT=3000
BACKEND_PORT=8080
AI_PORT=8000
LLM_PORT=5000
MYSQL_PORT=3306

# 백엔드 및 AI 서버 주소
BACKEND_URL=http://ocean-backend:8080
LLM_URL=http://ocean-llm:5000

# DB 설정
DATABASE_URL=mysql://root:${DATABASE_PW}@ocean-db:3306/ocean
DATABASE_PW=your_mysql_password

# OpenAI API 키
OPENAI_API_KEY=your_openai_api_key

# Hugging Face Token (선택)
HF_TOKEN=your_huggingface_token
```

> ⚠️ 모든 변수는 적절히 수정해야 합니다. 비밀번호 및 키는 외부에 노출되지 않도록 주의하세요.

---

### 2. Docker Compose 실행

```bash
docker-compose up --build
```

이 명령어는 모든 서비스를 빌드하고 실행합니다. 처음 실행 시 시간이 다소 걸릴 수 있습니다.

---

### 3. 서비스 접근

| 서비스                | 주소                                               |
| ------------------ | ------------------------------------------------ |
| 프론트엔드              | `http://localhost:3000` (혹은 설정한 `FRONTEND_PORT`) |
| 백엔드 API            | `http://localhost:8080`                          |
| AI 서비스             | `http://localhost:8000`                          |
| LLM 서비스            | `http://localhost:5000`                          |
| DB 접속(MySQL 클라이언트) | `localhost:3306`                                 |

---

## 🛠 기타 명령어

### 백그라운드 실행

```bash
docker-compose up -d
```

### 로그 확인

```bash
docker-compose logs -f
```

### 전체 중지 및 컨테이너 제거

```bash
docker-compose down
```

---

## 🧊 볼륨 설명

* `mysql-data` : MySQL 데이터 영속 저장
* `images` : 사용자 업로드 이미지 저장 (백엔드에서 사용)

---

## 🔗 의존성 관계

* `ocean-back` 와 `ocean-ai`는 `ocean-db`에 의존합니다.
* `ocean-front`는 `BACKEND_URL`, `LLM_URL`을 통해 다른 API와 통신합니다.

---

## 📎 참고

* Docker Desktop 설치 필요
* 시스템에 따라 포트 충돌이 발생할 수 있으므로 `.env`를 통해 포트를 조정하세요.
