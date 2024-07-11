# Project 
Deploy the Socks Shop microservice application on Kubernetes using Infrastructure as Code (IaC), emphasizing readability, maintainability, and DevOps practices.

##  Tools and Technologies
1. IaaS Provider: AWS
2. Infrastructure Provisioning: Terraform
3. Configuration Management: Ansible
4. Container Orchestration: Kubernetes (EKS on azure)
5. Monitoring: Prometheus
6. Certificate Management: Cert-Manager with Let's Encrypt
7. Logging: Fluentd, Elasticsearch, Kibana (or similar stack)
5. CI/CD: GitHub Actions.
9. Security: Ansible Vault, network policies, security groups

# Steps to achieve this projects 

## Set Up IaaS Provider
Create an Azure account and set up necessary IAM roles and policies.

## Install Necessary Tools
AWS CLI https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
Terraform 
kubectl https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
Helm https://helm.sh/docs/intro/install/
Ansible https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-ubuntu
Cert-Manager 
Prometheus, 
Ansible Vault.

## Provision Infrastructure with Terraform
Define a Terraform script to provision Azure infrastructure including VPC, subnets, EKS cluster, and necessary IAM roles and security groups.

## Configure Kubernetes with Ansible
Create an Ansible playbook to install Helm, deploy Cert-Manager, Prometheus, and the Socks Shop application.
Set Up HTTPS with Let’s Encrypt

## Configure Cert-Manager to obtain and manage Let's Encrypt certificates.
Set up an Ingress resource in Kubernetes to use the certificates for HTTPS.

## Set Up Monitoring with Prometheus
Deploy Prometheus to monitor the Kubernetes cluster and the Socks Shop application.

## Set Up Logging
Implement a logging solution using tools like Fluentd, Elasticsearch, and Kibana to collect and visualize logs.

## Secure the Infrastructure
Implement security measures including security groups, Kubernetes Network Policies, and use Ansible Vault to encrypt sensitive information.

## Create a Deployment Pipeline
Set up a CI/CD pipeline with tools like GitHub Actions, Jenkins, or GitLab CI to automate the deployment process.

