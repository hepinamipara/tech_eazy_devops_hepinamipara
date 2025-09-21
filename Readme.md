# Tech Eazy DevOps Project

This project demonstrates deploying a Spring Boot application (`hellomvc-0.0.1-SNAPSHOT.jar`) to an AWS EC2 instance using **Terraform** and **SCP/SSH**.

---

## **Project Structure**
.
├── backend/
│ └── hellomvc-0.0.1-SNAPSHOT.jar # Your Spring Boot JAR
├── scripts/
│ └── user_data.sh # Optional auto-install script
├── terraform/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
└── README.md

---

## **Steps to Deploy**

### **1️⃣ Provision Infrastructure with Terraform**

1. Navigate to the Terraform folder:

```bash
cd terraform
terraform init
terraform apply

scp -i "key\path\yourkey.pem" backend/hellomvc-0.0.1-SNAPSHOT.jar ec2-user@<EC2-PUBLIC-IP>:/home/ec2-user/backend/

ssh -i "key\path\yourkey.pem" ec2-user@<EC2-PUBLIC-IP>
sudo backend
sudo java -jar  hellomvc-0.0.1-SNAPSHOT.jar

http://<ec2-pub-ip>/hello
exit


