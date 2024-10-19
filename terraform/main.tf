provider "aws" {
  region = "us-east-1"  # Change this to your preferred region
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"  # Change this if needed
}

resource "aws_security_group" "allow_http" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
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

resource "aws_instance" "my_instance" {
  ami                    = "ami-0c55b159cbfafe1f0"  # Update to latest Amazon Linux 2 AMI for your region
  instance_type         = "t2.micro"  # or t2.small depending on your needs
  subnet_id             = aws_subnet.my_subnet.id
  vpc_security_group_ids = [aws_security_group.allow_http.id]

  tags = {
    Name = "DevOps-Server"
  }

  user_data = <<-EOF
 
#!/bin/sh
sudo apt update ; sudo apt upgrade -y
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update ; sudo apt upgrade -y
sudo apt-get install jenkins -y
sudo apt update ; sudo apt upgrade -y
sudo apt install openjdk-21-jdk
sudo apt install maven -y
sudo systemctl enable jenkins --now
sudo systemctl status jenkins
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-
microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install dotnet-sdk-3.1 -y
sudo apt install nginx -y
systemctl start nginx
systemctl enable nginx --now
              EOF
}

output "instance_ip" {
  value = aws_instance.my_instance.public_ip
}
