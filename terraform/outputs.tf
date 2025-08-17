# Output the ECR repository URLs for use in the CI/CD pipeline
output "backend_ecr_repo_url" {
  value = aws_ecr_repository.backend.repository_url
}

output "frontend_ecr_repo_url" {
  value = aws_ecr_repository.frontend.repository_url
}