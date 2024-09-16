resource "aws_instance" "main" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public.id

  security_groups = [aws_security_group.allow_web.id]

  tags = {
    Name = "kupply-app"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras install docker -y
              sudo service docker start
              sudo usermod -aG docker ec2-user
              # Additional configuration steps...
              EOF
}
