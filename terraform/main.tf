module "vpc" {
  source = "./modules/vpc"

  vpc_cidr                               = var.vpc_cidr
  routetable_cidr                        = var.routetable_cidr
  public_subnet_1                        = var.public_subnet_1 
  public_subnet_2                        = var.public_subnet_2
  public_subnet_map_public_ip_on_launch  = var.public_subnet_map_public_ip_on_launch
  private_subnet_1                       = var.private_subnet_1
  private_subnet_2                       = var.private_subnet_2
  private_subnet_map_public_ip_on_launch = var.private_subnet_map_public_ip_on_launch
}

module "acm" {
  source = "./modules/acm"

  domain_name        = var.domain_name
  private_zone       = var.private_zone
  hosted_zone        = var.hosted_zone
}

module "alb" {
  source = "./modules/alb"

  vpc_id             = module.vpc.vpc_id
  subnet_public1_id  = module.vpc.public_subnet1_id
  subnet_public2_id  = module.vpc.public_subnet2_id
  application_port   = var.application_port
  ingress_cidr       = var.ingress_cidr
  egress_cidr        = var.egress_cidr
  certificate_arn    = module.acm.certificate_arn

  depends_on = [module.acm]
}

module "ecs" {
  source = "./modules/ecs"

  vpc_id             = module.vpc.vpc_id
  subnet_private1_id = module.vpc.private_subnet1_id
  subnet_private2_id = module.vpc.private_subnet2_id
  tg_arn             = module.alb.tg_arn
  application_port   = var.application_port
  ecs_container_name = var.ecs_container_name
  ecs_docker_port    = var.ecs_docker_port
  ecs_memory         = var.ecs_memory
  ecs_cpu            = var.ecs_cpu
  ecs_desired_count  = var.ecs_desired_count
  ecs_image          = var.ecs_image
  ingress_cidr       = var.ingress_cidr
  egress_cidr        = var.egress_cidr
}
