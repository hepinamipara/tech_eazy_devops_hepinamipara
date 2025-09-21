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
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key-name
  security_groups = [aws_security_group.maven-sg.id]
  user_data       = file("../Scripts/user_data.sh")
}
