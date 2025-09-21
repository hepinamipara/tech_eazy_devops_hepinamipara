output "ec2-pub-ip" {
  value = aws_instance.dev.public_ip
}