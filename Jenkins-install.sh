#Install Jenkins.
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
sudo apt install fontconfig openjdk-17-jre
echo "java --version"
sudo systemctl enable jenkins --now
echo "sudo systemctl status jenkins"
