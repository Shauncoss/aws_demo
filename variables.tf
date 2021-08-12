variable "vault_backend" {
  type    = string
  default = "aws"
}
variable "vault_role" {
  type    = string
  default = "awsuser"
}
variable "ubuntu_key_name" {
  type    = string
  default = "ubuntu-key"
}
variable "ubuntu_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDPfbmXx4xboyRkaUbtKmJSBILKc4kcWiqcR6+GLHgi9c721SH8iMPcvsyrDvj6BJoo8VDIFRAiIa2mZNKsi2a5ZL9u5ro35yTuyEv8nyZwjXAZgO8sXtuols8OMeR8I0466wIFmFDUukQzXPOYiHHTcpIVJ9aMMXqZRj5j8mu5on+yrivWyQ3VmnyqxzWZEYhiBHM335hj05yTR5BHJpSWBr0iXlTsstkoOC6+skhwm6klBA5vGQ46YhMaXaeBpZH1QEeZOQAORpguvoAiFQ2Mj2Bc9mMzZPygbznZBMY+Y9jyL1hHIMz3KmCqBQkV/NaEVl8+Rw5DLFbPRc7eqC+vW9gpPIa5tNbnsHOdNBnc7zcWrRcHoh3fbyTRmbyC8wNVe2OLMTz3mmSFOSfEvyfs+KLutKeZxP/ANREBlCgxpohu07JWFhPSDX0QeLFd5F75NZe8G10En/KMyom07nzqBb6Ao9IKO+kXMgp+M87i7PI4EZntUkSztJ50rBQA4jM= tatoe@tatoe-pc"
}

variable "sg_name" {
  type    = string
  default = "awsdemo_sg"
}

variable "sg_description" {
  type    = string
  default = "allow icmp and ssh"
}
variable "vpc" {
  type    = string
  default = "vpc-734c3d0e"
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "ami_id" {
  type    = string
  default = "ami-0d08a21fc010da680"
}

variable "instance_tag" {
  type    = string
  default = "demo-vm"
}
variable "username" {
  type = string
}

variable "password" {
  type = string
}