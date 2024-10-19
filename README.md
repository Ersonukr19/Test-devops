# Test-devops
Project Submission

## Project Overview

This project demonstrates a DevOps pipeline implementation using Jenkins and Infrastructure as Code (IaC) principles. The main objectives of this project are to automate the deployment process, establish a CI/CD pipeline, and manage infrastructure provisioning using IaC techniques.

## Repository Structure.

devops-project/
├── Jenkinsfile                # Jenkins pipeline configuration
├── iaC/                       # Infrastructure as Code scripts
│   └── main.tf               # Terraform script for resource creation
├── scripts/                  # Deployment and utility scripts
│   └── deployment.sh         # Script to deploy the application
├── docs/                     # Documentation files
│   └── setup_guide.md        # Detailed setup and deployment guide
└── README.md                 # Project overview and instructions


## Getting Started

### Prerequisites

To run this project, you will need:
- **Git:** [Download Git](https://git-scm.com/)
- **Jenkins:** [Install Jenkins](https://www.jenkins.io/doc/book/installing/)
- **Terraform:** [Install Terraform](https://www.terraform.io/downloads.html)
- **Access to Google Cloud/AWS/Azure:** Ensure you have an account to provision resources.

### using terraform create infrastracture.
cd terraform
# install terraform in server
./terrraform.sh
# After install
Terraform --version
Terrafrom init
terraform apply 
# so it will create infra and install jenkins also on the server.
# cd ..
# cat /var/jenkins_home/secrets/initialAdminPassword

## check with ip:8080
# paste the passwoprd
# select pipeline
# cd /jenkins
# copy jenkins pipeline and paste to pipeline job.
# then click on build 
# after biuld that artifact move to /var/www/html as configure and using ip we can access the webpage.





