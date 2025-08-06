# 📦 DevOps Project: Zomato Clone – CI/CD with Jenkins, Docker, Kubernetes, ArgoCD, and Terraform

This project demonstrates a full-stack DevOps pipeline using modern tools and practices. It includes CI/CD, containerization, infrastructure as code, code quality checks, and real-time monitoring.

---

## 📌 Project Overview

- **Frontend App:** Zomato Clone (Node.js)
- **CI/CD Tool:** Jenkins
- **Containerization:** Docker
- **Orchestration:** Kubernetes (EKS)
- **Infrastructure as Code:** Terraform
- **GitOps:** ArgoCD
- **Code Quality:** SonarQube, OWASP Dependency Check, Trivy
- **Container Security:** Docker Scout
- **Monitoring:** Prometheus + Grafana
- **Email Alerts:** Jenkins Email Ext Plugin with Gmail SMTP

---

## 📁 Project Structure

```
DevOps-Project-Zomato-Kastro/
├── Dockerfile
├── deployment.yaml
├── service.yaml
├── jenkins-pipeline.groovy
├── sonar-project.properties
├── trivy.txt (generated)
├── terraform/
│   ├── main.tf
│   └── ...
└── README.md
```

---

## 🔧 Tools Used

| Tool            | Purpose                              |
|-----------------|--------------------------------------|
| **Terraform**   | Provision VPC, EKS, EC2, IAM         |
| **Jenkins**     | CI/CD pipeline automation            |
| **Docker**      | App containerization                 |
| **Kubernetes**  | Container orchestration (EKS)        |
| **ArgoCD**      | GitOps-based deployment              |
| **SonarQube**   | Code quality and static analysis     |
| **OWASP Check** | Dependency scanning for vulnerabilities |
| **Trivy**       | File system scanning for security    |
| **Docker Scout**| Container security scan              |
| **Prometheus**  | Metrics collection                   |
| **Grafana**     | Visualization of metrics             |
| **Gmail SMTP**  | Email notifications                  |

---

## 🌐 Architecture Diagram
---
> 
<img width="1536" height="1024" alt="ChatGPT Image Aug 5, 2025, 08_59_30 PM" src="https://github.com/user-attachments/assets/7e3a49b6-83ed-4450-807b-60743075905a" />

High-level overview:

- Terraform provisions AWS infrastructure (VPC, EKS, EC2)
- Jenkins installed in EC2 (private subnet) with NAT Gateway
- Node.js app is built & scanned in Jenkins
- Docker image pushed to DockerHub
- Kubernetes manifests managed in GitHub → auto-synced with ArgoCD
- Monitoring with Prometheus & Grafana
- Email alerts sent post-build with Trivy results

---

## 🚀 CI/CD Workflow (Jenkins Pipeline)

### ✅ Stages:

1. **Clean Workspace**
2. **Checkout Code**
3. **SonarQube Analysis**
4. **Code Quality Gate**
5. **Install Dependencies**
6. **OWASP Dependency Check**
7. **Trivy Scan**
8. **Docker Build**
9. **Push to DockerHub**
10. **Docker Scout Scan**
11. **Deploy Container**
12. **Email Notification with Attachment (Trivy)**
![jenkins](https://github.com/user-attachments/assets/6e596f6d-7ede-4568-9834-55ead4439cc9)
---

### 📧 Email Format:
HTML-based mail with:
- Project Name
- Build Number
- Build URL
- Trivy Scan as attachment

---

## ⚙️ Key Jenkinsfile Snippet

```groovy
post {
  always {
    emailext attachLog: true,
      subject: "'${currentBuild.result}'",
      body: "...HTML content...",
      to: 'jangaharidee@gmail.com',
      mimeType: 'text/html',
      attachmentsPattern: 'trivy.txt'
  }
}
```

---

## 🛡️ Security Scans

| Tool        | Scan Type                 |
|-------------|---------------------------|
| SonarQube   | Static Code Analysis      |
| Trivy       | File System Vulnerability |
| OWASP Check | Dependency Vulnerability  |
| Docker Scout| Container Image Security  |

---
![sonar](https://github.com/user-attachments/assets/c6809661-6c97-4ff8-af5b-7ea5b75c663a)
---

## 🚢 Kubernetes Deployment (ArgoCD)
---
![eks](https://github.com/user-attachments/assets/b8fac1f9-0fe3-4f6d-9dc8-434f1e1f4a90)
---
### Sample `service.yaml`

```yaml
apiVersion: v1
kind: Service
metadata:
  name: zomato
spec:
  type: LoadBalancer
  ports:
    - port: 80
      targetPort: 3000
  selector:
    app: LoadBalancer
```

### ArgoCD Sync Output:

```
kubectl get applications -n argocd
NAME     SYNC STATUS   HEALTH STATUS
zomoto   Synced        Healthy
```
![argocd](https://github.com/user-attachments/assets/a97723d1-3238-4775-b1df-19537774427c)

---

## 📊 Monitoring & Alerts

- Prometheus scrapes metrics from Jenkins and Node app
- Grafana dashboards visualize metrics
- Email alerts triggered on every Jenkins build

---![grafana](https://github.com/user-attachments/assets/81ed2d41-812f-4792-aa13-fc780d7c9633)
![prometheus](https://github.com/user-attachments/assets/5c80a7a8-485c-4027-b305-77075db85c0a)


## 🧱 Infrastructure (Terraform)

Terraform modules include:

- VPC with public/private subnets
- NAT Gateway and Internet Gateway
- EKS Cluster + Worker Nodes
- EC2 instance for Jenkins

---

## 🔐 Email Notification Setup

### Gmail SMTP Settings (Jenkins → Manage Jenkins → Email Ext Plugin):

- SMTP Server: `smtp.gmail.com`
- Port: `465`
- SSL: Enabled
- Auth: Enabled
- User: `jangaharidee@gmail.com`
- Password: **App Password**
- Default Recipients: `jangaharidee@gmail.com`
- Content Type: `HTML (text/html)`

---

## 📦 DockerHub

Docker images pushed with tags:

```
harideep0412/zomato-<build_number>:latest
```
![dockerhub](https://github.com/user-attachments/assets/55dd6967-1d6b-44ae-97a4-7c251ddc7376)

---
![zomoto](https://github.com/user-attachments/assets/dcbd853e-08a1-4958-9928-0e4753082626)
---

## 💡 Future Enhancements

- Add Helm chart for Zomato app
- Setup Slack notifications
- Use GitHub Actions for CI
- Enable RBAC for Jenkins & ArgoCD
- Automate Prometheus + Grafana using Helm

---

## 🙋‍♂️ Author

**Harideep Janga**  
DevOps Enthusiast | AWS | Jenkins | Kubernetes  
📧 jangaharidee@gmail.com  
🔗 [GitHub](https://github.com/JangaHarideep04)
