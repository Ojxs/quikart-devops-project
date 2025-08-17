# Define the task definition for the backend service
resource "aws_ecs_task_definition" "backend" {
  family                   = "quikart-backend-task"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"

  container_definitions = jsonencode([
    {
      name  = "quikart-backend"
      image = "${aws_ecr_repository.backend.repository_url}:latest"
      cpu   = 256
      memory = 512
      essential = true
      portMappings = [
        {
          containerPort = 5000
          hostPort      = 5000
        }
      ]
    }
  ])
}

# Define the task definition for the frontend service
resource "aws_ecs_task_definition" "frontend" {
  family                   = "quikart-frontend-task"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"

  container_definitions = jsonencode([
    {
      name  = "quikart-frontend"
      image = "${aws_ecr_repository.frontend.repository_url}:latest"
      cpu   = 256
      memory = 512
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}

# Create the ECS Service for the backend
resource "aws_ecs_service" "backend" {
  name            = "quikart-backend-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.backend.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    # **IMPORTANT:** Replace these with your actual VPC subnet and security group IDs
    subnets = ["subnet-XXXXXXX", "subnet-YYYYYYY"]
    security_groups = ["sg-ZZZZZZZ"]
  }
}

# Create the ECS Service for the frontend
resource "aws_ecs_service" "frontend" {
  name            = "quikart-frontend-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.frontend.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    # **IMPORTANT:** Replace these with your actual VPC subnet and security group IDs
    subnets = ["subnet-XXXXXXX", "subnet-YYYYYYY"]
    security_groups = ["sg-ZZZZZZZ"]
  }
}