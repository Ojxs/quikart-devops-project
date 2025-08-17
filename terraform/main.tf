# Define the AWS provider and region
provider "aws" {
  region = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_access_key
}

# Create Elastic Container Registry (ECR) for our backend Docker image
resource "aws_ecr_repository" "backend" {
  name = "quikart-backend"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}

# Create Elastic Container Registry (ECR) for our frontend Docker image
resource "aws_ecr_repository" "frontend" {
  name = "quikart-frontend"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}

# Create an ECS cluster to run our services
resource "aws_ecs_cluster" "main" {
  name = "quikart-cluster"
}