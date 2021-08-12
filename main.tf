data "vault_aws_access_credentials" "aws_creds" {
  backend = var.vault_backend
  role    = var.vault_role
}

data "aws_ami" "instance_ami" {
  owners      = ["137112412989"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*"]
  }

  filter {
    name   = "virtualization_type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
resource "aws_key_pair" "ubuntu" {
  key_name   = var.ubuntu_key_name
  public_key = var.ubuntu_key
}
resource "aws_security_group" "sg" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.vpc

  ingress = [
    {
      description      = "Allow ssh"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["45.16.0.0/12"]
      ipv6_cidr_blocks = null
      prefix_list_ids  = null
      self             = false
      security_groups  = null
    },
    {
      description      = "Allow ICMP"
      from_port        = "-1"
      to_port          = "-1"
      protocol         = "icmp"
      cidr_blocks      = ["45.16.0.0/12"]
      ipv6_cidr_blocks = null
      prefix_list_ids  = null
      self             = false
      security_groups  = null
    }
  ]
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow all egress"
    from_port        = 0
    ipv6_cidr_blocks = null
    prefix_list_ids  = null
    protocol         = "-1"
    security_groups  = null
    self             = false
    to_port          = 0
  }]

}
resource "aws_instance" "testvm" {
  ami                    = data.aws_ami.instance_ami.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.ubuntu.key_name
  vpc_security_group_ids = [aws_security_group.sg.id]
  tags = {
    Name = var.instance_tag
  }
}
output "ec2_ip" {
  value = aws_instance.testvm.public_dns
}