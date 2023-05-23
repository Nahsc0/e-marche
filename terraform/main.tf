#Provision the ec2 instance for CLIENT
resource "aws_instance" "server_instance" {
  ami                    = "ami-007855ac798b5175e"
  instance_type          = "t2.micro"
  key_name               = "nasco"
  vpc_security_group_ids = [aws_security_group.general-sg.id]

  tags = {
    "Name" = "client"
  }
}

#Provision the ec2 instance for SERVER
resource "aws_instance" "client_instance" {
  ami                    = "ami-007855ac798b5175e"
  instance_type          = "t2.micro"
  key_name               = "nasco"
  vpc_security_group_ids = [aws_security_group.general-sg.id]

  tags = {
    "Name" = "server"
  }
}


# Provision the security group
resource "aws_security_group" "general-sg" {
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]

  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "allow ssh"
    from_port        = 22
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 22
    },

    {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "allow https"
    from_port        = 443
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 443
    },

    {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "allow http"
      from_port        = 80
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 80
  }]
}

