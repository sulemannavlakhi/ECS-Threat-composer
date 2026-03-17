resource "aws_ecr_repository" "ecs_threat" {
  name                 = "threat-composer"
  force_delete         = true
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}