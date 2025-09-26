# Spring Boot AWS Deployment

## 📁 Project Structure

```
.
├── backend/
│   └── hellomvc-0.0.1-SNAPSHOT.jar # Your Spring Boot JAR
├── scripts/
│   └── user_data.sh # Optional auto-install script
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
└── README.md
```

---

## **Steps to Deploy**

### **1️⃣ Provision Infrastructure with Terraform**

1. Navigate to the Terraform folder:
   ```bash
   cd terraform
   terraform init
   terraform apply
   ```

2. Copy your Spring Boot JAR to the EC2 instance:
   ```bash
   scp -i "key\path\yourkey.pem" backend/hellomvc-0.0.1-SNAPSHOT.jar ec2-user@<EC2-PUBLIC-IP>:/home/ec2-user/backend/
   ```

3. SSH into your EC2 instance:
   ```bash
   ssh -i "key\path\yourkey.pem" ec2-user@<EC2-PUBLIC-IP>
   ```

4. Start the application:
   ```bash
   sudo backend
   sudo java -jar hellomvc-0.0.1-SNAPSHOT.jar

   java -jar hellomvc-0.0.1-SNAPSHOT.jar \
     --logging.file.name=/var/log/myapp/hellomvc.log  for store log into this path 
   ```

5. Access your application:
   ```
   http://<ec2-pub-ip>/hello
   ```

6. Exit SSH session:
   ```bash
   exit
   ```
