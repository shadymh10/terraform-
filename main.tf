provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "app01" { 
  ami                         = "ami-0341d95f75f311023"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnet01.id
  associate_public_ip_address = true
  key_name                    = "red"
  availability_zone           = "us-east-1a"
  security_groups             = [aws_security_group.project.id]
  tags = {
    Name = "my-app01"
  }
  user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install nginx -y
                sudo systemctl start nginx
                sudo systemctl enable nginx
                echo "<h1>Welcome to my Public Web Server app01</h1>" > /var/www/html/index.html
                EOF 
}
resource "aws_instance" "app02" { 
  ami                         = "ami-0341d95f75f311023"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.private_subnet01.id
  associate_public_ip_address = false
  key_name                    = "red"
  availability_zone           = "us-east-1a"
  security_groups             = [aws_security_group.project.id]
  tags = {
    Name = "my-private-app"
  }
  user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install nginx -y
                sudo systemctl start nginx
                sudo systemctl enable nginx
                echo "<h1>Welcome to my Private Web Server</h1>" > /var/www/html/index.html
                EOF

}
resource "aws_instance" "data" { 
 
  ami                         = "ami-0341d95f75f311023"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnet02.id
  associate_public_ip_address = true
  key_name                    = "red"
  availability_zone           = "us-east-1b"
  security_groups             = [aws_security_group.project.id]
  tags = {
    Name = "my-app02"
  }
  user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install nginx -y
                sudo systemctl start nginx
                sudo systemctl enable nginx
                echo "<h1>Welcome to my Public Web Server app02</h1>" > /var/www/html/index.html
                EOF
}