resource "aws_instance" "main" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public.id

  security_groups = [aws_security_group.allow_web.id]

  tags = {
    Name = "kupply-instance"
  }

  user_data = <<-EOF
              #!/bin/bash
              # Install Docker
              sudo yum update -y
              sudo yum install docker -y
              sudo service docker start
              sudo usermod -aG docker ec2-user
              # Install Nginx
              sudo yum install nginx -y
              sudo systemctl start nginx
              # Install Certbot
              # sudo dnf install -y augeas-libs
              # sudo python3 -m venv /opt/certbot/
              # sudo /opt/certbot/bin/pip install --upgrade pip
              # sudo /opt/certbot/bin/pip install certbot
              # sudo ln -s /opt/certbot/bin/certbot /usr/bin/certbot
              EOF
}
