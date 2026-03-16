resource "aws_ecr_repository" "ecs_threat" {
  name                 = "threat-composer"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}