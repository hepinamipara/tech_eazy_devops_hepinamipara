variable "ami" {
    type = string
  default = "ami-08982f1c5bf93d976"
}
variable "instance_type" {
    type = string
  default = "t2.micro"
}
variable "key-name" {
    type = string
  default = "linux"
}
