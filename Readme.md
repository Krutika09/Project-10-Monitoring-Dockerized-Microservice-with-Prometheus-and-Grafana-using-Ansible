## ✅ **Complete EC2 Setup for Dockerized Microservice Monitoring with Prometheus & Grafana Using Ansible**

---

Here is a complete **step-by-step guide** to set up the project **“Monitor Dockerized Microservice with Prometheus & Grafana via Ansible”**, starting from **creating an EC2 instance** and going all the way to automated monitoring using Ansible.

---

## ✅ **Project: Monitor Dockerized Microservices with Prometheus & Grafana using Ansible**

---

## 📌 **Project Architecture**

1. **EC2 Instance (Ubuntu)** – acts as the monitored host and runs:

   * Dockerized Microservice
   * Prometheus
   * Grafana

2. **Ansible (on same or another system)** – used to automate:

   * Docker installation
   * Microservice container run
   * Prometheus & Grafana deployment

---

## 📘 **1. Launch EC2 Instance**

* **AMI**: Ubuntu 22.04 LTS

* **Instance Type**: t2.micro (for testing)

* **Security Group Rules**:

  * Port 22 (SSH)
  * Port 8000 (Microservice)
  * Port 9090 (Prometheus)
  * Port 3000 (Grafana)

* Connect to your EC2 instance:

```bash
ssh -i your-key.pem ubuntu@<public-ip>
```

---

## 📘 **2. Install Docker & Docker Compose Manually (Optional)**

> You can skip this step if you use Ansible to install Docker automatically.

```bash
sudo apt update
sudo apt install -y docker.io docker-compose
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER
newgrp docker
```

---

## 📘 **3. Setup Project Folder on Ansible Control Machine**

Structure:

```
monitoring-project/
├── ansible.cfg
├── inventory
├── playbook.yml
├── roles/
│   ├── docker/
│   ├── prometheus/
│   ├── grafana/
├── prometheus/
│   ├── Prometheus.yml
├── docker-compose.yml
└── microservice/
    ├── app.py
    └── Dockerfile
```

---

### 🔹 1. **Copy SSH Key from Local (Windows) to EC2**

```powershell
scp -i C:\Users\Krutika\Downloads\VPC.pem C:\Users\Krutika\Downloads\VPC.pem ubuntu@35.94.193.157:/home/ubuntu/.ssh/VPC.pem
```

---

### 🔹 2. **SSH into EC2 Instance**

```bash
ssh -i ~/.ssh/VPC.pem ubuntu@35.94.193.157
```

---

### 🔹 3. **Fix Permissions of SSH Key**

```bash
chmod 400 ~/.ssh/VPC.pem
ls -l /home/ubuntu/.ssh
```

---

### 🔹 4. **Install Docker**

```bash
sudo apt update
sudo apt install -y docker.io docker-compose
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER
newgrp docker
```

✅ **Why:** Required to run containers for Prometheus, Grafana, and your microservice.

✅ **Why:** Docker Compose lets you define and run multi-container applications using `docker-compose.yml`.

✅ **Why:** So you don’t need `sudo` every time you run Docker commands.

---

### 🔹 5. **Install Ansible**

```bash
sudo apt install ansible-core -y
```

---

### 🔹 6. **Verify Ansible Connectivity to EC2 (from your Ansible control node)**

```bash
ansible -i inventory all -m ping
```

---

### 🔹 7. **Run Your Ansible Playbook**

```bash
ansible-playbook -i inventory playbook.yml
```

✅ **Why:** Automates Docker, Prometheus, Grafana, and microservice setup using roles and tasks.

---

### 🔹 8. **Build and Run Your Dockerized Microservices**

#### (After playbook runs, or manually if needed)

```bash
docker-compose build
```

✅ **Why:** Builds Docker image for your custom microservice (if not already built)

```bash
docker-compose up -d
```

✅ **Why `-d`:** Runs containers in the background (detached mode) so your terminal stays free.

---

### 🔹 9. **Stop Services**

```bash
docker-compose down
```

✅ **Why:** Gracefully stops and removes containers, network, and volumes defined in your `docker-compose.yml`.

---

