resource "aws_instance" "my_ec2_instance" {
  ami           = var.ami
  instance_type = var.instance_type

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras install docker -y
              sudo service docker start
              sudo usermod -aG docker ec2-user
              # Additional configuration steps...
              EOF

  tags = {
    Name = "MyEC2WithDockerAndSSL"
  }

  vpc_security_group_ids = [aws_security_group.my_sg.id]
}

resource "aws_security_group" "my_sg" {
  name        = "allow_http_https"
  description = "Allow HTTP and HTTPS inbound traffic"

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

  ingress {
    from_port   = 443
    to_port     = 443
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
