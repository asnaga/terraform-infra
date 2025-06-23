provider "aws" { region = var.region }

module "vpc" {
  source      = "../../modules/vpc"
  vpc_cidr    = var.vpc_cidr
  environment = var.environment
}

module "elb" {
  source      = "../../modules/elb"
  vpc_id      = module.vpc.vpc_id
  subnets     = module.vpc.public_subnets
  environment = var.environment
}

module "ecs" {
  source      = "../../modules/ecs"
  subnets     = module.vpc.public_subnets
  environment = var.environment
}

module "rds" {
  source      = "../../modules/rds"
  vpc_id      = module.vpc.vpc_id
  subnets     = module.vpc.public_subnets
  environment = var.environment
}

module "redis" {
  source      = "../../modules/redis"
  vpc_id      = module.vpc.vpc_id
  subnets     = module.vpc.public_subnets
  environment = var.environment
}

module "s3" {
  source      = "../../modules/s3"
  environment = var.environment
}
