# AWS ECS THREAT COMPOSER APP

## Introduction

This project deploys a Threat Composer application onto AWS ECS Fargate using Terraform. GitHub actions is utilized through CI/CD pipelines for automation and Docker is used to containerize the application. The Threat Composer application is used by security professionals to identify and mitigate threats to their systems. 

## Architecture Diagram

![AWS Architecture](images/AWS-Architecture.png)

## Project Structure 

├── .github/
│   └── workflows/
│       ├── build-push.yml
│       ├── destroy.yml
│       └── init-plan-apply.yml
├── app/
│   ├── Dockerfile
│   └── .dockerignore
├── images/
├── terraform/
│   ├── modules/
│   │   ├── acm/
│   │   │   ├── main.tf
│   │   │   ├── output.tf
│   │   │   └── variables.tf
│   │   ├── alb/
│   │   │   ├── main.tf
│   │   │   ├── output.tf
│   │   │   └── variables.tf
│   │   ├── ecr/
│   │   │   ├── main.tf
│   │   │   ├── output.tf
│   │   │   └── variables.tf
│   │   ├── ecs/
│   │   │   ├── main.tf
│   │   │   ├── output.tf
│   │   │   └── variables.tf
│   │   └── vpc/
│   │       ├── main.tf
│   │       ├── output.tf
│   │       └── variables.tf
│   ├── main.tf
│   ├── provider.tf
│   ├── terraform.tfvars
│   └── variables.tf
├── .gitignore
└── README.md

