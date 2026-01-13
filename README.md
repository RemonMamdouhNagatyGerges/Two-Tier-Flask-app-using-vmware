# 🚀 Two-Tier Flask Application with VMware

> A production-ready, containerized Flask web application demonstrating modern DevOps practices, CI/CD automation, and cloud-native architecture.

[![CI/CD Pipeline](https://img.shields.io/badge/CI%2FCD-GitHub%20Actions-blue)](https://github.com/RemonMamdouhNagatyGerges/Two-Tier-Flask-app-using-vmware/blob/main/Jenkinsfile)
[![Python 3.9+](https://img.shields.io/badge/Python-3.9+-green)](https://www.python.org/)
[![Docker](https://img.shields.io/badge/Docker-Containerized-2496ED)](https://www.docker.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow)](LICENSE)

---

## 📋 Table of Contents

- [About](#-about)
- [Features](#-features)
- [Architecture](#-architecture)
- [Tech Stack](#-tech-stack)
- [Prerequisites](#-prerequisites)
- [Installation](#-installation)
- [Running Locally](#-running-locally)
- [Docker Deployment](#-docker-deployment)
- [CI/CD Pipeline](#-cicd-pipeline)
- [Project Structure](#-project-structure)
- [Contributing](#-contributing)
- [License](#-license)

---

## 📖 About

This project showcases a **production-grade Flask application** deployed on VMware infrastructure with complete automation. It demonstrates best practices in:

✅ **Containerization** with Docker  
✅ **Infrastructure as Code** (IaC)  
✅ **Continuous Integration/Continuous Deployment** (CI/CD)  
✅ **Database Management** with SQLAlchemy ORM  
✅ **Security** with non-root Docker users  
✅ **Scalability** using Docker Compose  

---

## ⭐ Features

- 🐳 **Fully Containerized** - Docker & Docker Compose ready
- 🔄 **Automated CI/CD** - GitHub Actions for testing & deployment
- 🗄️ **Database Integration** - SQLAlchemy ORM with SQLite
- 🔐 **Security Best Practices** - Non-root containers, environment variables
- 📊 **Logging & Monitoring** - Structured logging for debugging
- 🧪 **Unit Testing** - Pytest integration with automated testing
- 🚀 **Production Ready** - Gunicorn WSGI server configuration

---

## 🏗️ Architecture

```
┌─────────────────────────────────────────┐
│        GitHub Actions (CI/CD)           │
│  ┌─────────────┬──────────────┐         │
│  │   Test      │  Build & Push │         │
│  └─────────────┴──────────────┘         │
└──────────────────┬──────────────────────┘
                   │
┌──────────────────┴──────────────────────┐
│      Docker Container (Flask App)       │
│  ┌──────────────────────────────────┐   │
│  │  Flask Application (Gunicorn)    │   │
│  │  ├─ Routes & Controllers         │   │
│  │  ├─ Database Models             │   │
│  │  └─ Business Logic              │   │
│  └──────────────────────────────────┘   │
│  Port: 5000                             │
└──────────────────┬──────────────────────┘
                   │
┌──────────────────┴──────────────────────┐
│     SQLite Database (Persistent)        │
└─────────────────────────────────────────┘
```

---

## 🛠️ Tech Stack

| Component | Technology | Version |
|-----------|-----------|---------|
| **Backend Framework** | Flask | 2.x |
| **ORM** | SQLAlchemy | Latest |
| **Database** | SQLite | 3.x |
| **Containerization** | Docker | 20.10+ |
| **Orchestration** | Docker Compose | 1.29+ |
| **Python Version** | Python | 3.9+ |
| **Testing** | Pytest | Latest |
| **CI/CD** | GitHub Actions | Built-in |
| **Web Server** | Gunicorn | Latest |

---

## 📋 Prerequisites

Before you begin, ensure you have installed:

- **Python 3.9+** - [Download](https://www.python.org/downloads/)
- **Docker** - [Download](https://www.docker.com/products/docker-desktop)
- **Docker Compose** - [Download](https://docs.docker.com/compose/install/)
- **Git** - [Download](https://git-scm.com/)

---

## 💾 Installation

### 1. Clone the Repository

```bash
git clone https://github.com/RemonMamdouh/Two-Tier-Flask-app-using-vmware.git
cd Two-Tier-Flask-app-using-vmware
```

### 2. Create Virtual Environment

```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

### 3. Install Dependencies

```bash
pip install --upgrade pip
pip install -r requirements.txt
```

---

## 🏃 Running Locally

### Development Mode

```bash
python run.py
```

The application will be available at: **http://localhost:5000**

### Environment Variables

Create a `.env` file in the project root:

```bash
FLASK_ENV=development
FLASK_DEBUG=True
DATABASE_URL=sqlite:///app.db
```

---

## 🐳 Docker Deployment

### Build Docker Image

```bash
docker build -t flask-app:latest .
```

### Run with Docker

```bash
docker run -p 5000:5000 \
  -v $(pwd)/database:/app/database \
  -v $(pwd)/logs:/app/logs \
  flask-app:latest
```

### Deploy with Docker Compose

```bash
docker-compose up -d
```

View logs:
```bash
docker-compose logs -f
```

Stop services:
```bash
docker-compose down
```

---

## 🔄 CI/CD Pipeline

This project uses **GitHub Actions** for automated:

### ✅ Testing Stage
- Runs on: Every push & pull request
- Python version: 3.9
- Tests: `pytest` with coverage
- Dependencies: Auto-installed from `requirements.txt`

### 🏗️ Build & Deploy Stage
- Triggers: Main branch pushes only
- Builds Docker image
- Runs container health checks
- Ready for production deployment

**View pipeline status:** [GitHub Actions](https://github.com/RemonMamdouh/Two-Tier-Flask-app-using-vmware/actions)

---

## 📁 Project Structure

```
Two-Tier-Flask-app-using-vmware/
│
├── 📄 run.py                    # Application entry point
├── 📄 requirements.txt          # Python dependencies
├── 📄 Dockerfile               # Docker image definition
├── 📄 docker-compose.yml       # Multi-container orchestration
│
├── 📁 app/                      # Flask application package
│   ├── __init__.py             # App factory & initialization
│   ├── routes.py               # API routes & endpoints
│   ├── models.py               # Database models (SQLAlchemy)
│   └── config.py               # Configuration settings
│
├── 📁 tests/                    # Unit tests
│   ├── test_app.py             # Application tests
│   └── conftest.py             # Pytest configuration
│
├── 📁 database/                 # Persistent database storage
│   └── app.db                  # SQLite database
│
├── 📁 logs/                     # Application logs
│
├── 📁 .github/workflows/        # GitHub Actions workflows
│   └── ci-cd.yml               # CI/CD pipeline configuration
│
├── 📄 .gitignore               # Git ignore rules
├── 📄 README.md                # This file
└── 📄 LICENSE                  # MIT License
```

---

## 🧪 Testing

### Run All Tests

```bash
pytest -v
```

### Run Specific Test

```bash
pytest tests/test_app.py -v
```

### Test Coverage

```bash
pip install pytest-cov
pytest --cov=app tests/
```

---

## 🚀 Deployment Guide

### Deploy to VMware vSphere

1. **Prepare VMware Host:**
   ```bash
   # SSH into your VMware instance
   ssh user@your-vmware-ip
   ```

2. **Clone Repository:**
   ```bash
   git clone https://github.com/RemonMamdouh/Two-Tier-Flask-app-using-vmware.git
   cd Two-Tier-Flask-app-using-vmware
   ```

3. **Deploy with Docker Compose:**
   ```bash
   docker-compose up -d
   ```

4. **Verify Deployment:**
   ```bash
   curl http://localhost:5000
   docker-compose logs -f
   ```

---

## 📊 Performance Metrics

- **Startup Time:** < 2 seconds
- **Container Size:** ~200MB (Python 3.9-slim)
- **Memory Usage:** ~80MB at idle
- **Database:** Instant local SQLite queries

---

## 🔒 Security Features

✅ Non-root user execution in Docker  
✅ Environment variable-based configuration  
✅ No hardcoded secrets  
✅ SQLAlchemy ORM prevents SQL injection  
✅ Gunicorn as production WSGI server  

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📝 License

This project is licensed under the **MIT License** - see [LICENSE](LICENSE) file for details.

---

## 📞 Contact & Support

- **GitHub:** [@RemonMamdouh](https://github.com/RemonMamdouh)
- **LinkedIn:** [Your LinkedIn Profile](https://linkedin.com/in/your-profile)
- **Email:** your-email@example.com

---

## 🎯 Roadmap

- [ ] Add Redis caching layer
- [ ] Implement JWT authentication
- [ ] Add API documentation (Swagger/OpenAPI)
- [ ] Kubernetes deployment (Helm charts)
- [ ] Multi-tier database architecture
- [ ] Load balancing configuration

---

## ⭐ If you find this project helpful, please consider giving it a star!

**Made with ❤️ by Remon Mamdouh**