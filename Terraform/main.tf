# Security Group
resource "aws_security_group" "maven-sg" {
  name        = "maven-sg"
  description = "Allow SSH and HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "dev" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key-name
  vpc_security_group_ids = [aws_security_group.maven-sg.id]
  user_data              = file("../Scripts/user_data.sh")
}


# scp -i C:\Users\AMIPARA HEPIN\Downloads\linux.pem backend/hellomvc-0.0.1-SNAPSHOT.jar ec2-user@<EC2-PUBLIC-IP>:/home/ec2-user/backend/
