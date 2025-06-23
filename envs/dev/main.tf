provider "aws" { region = var.region }

module "vpc" {
  source      = "git::https://github.com/asnaga/terraform-modules.git//modules/vpc?ref=main"
  vpc_cidr    = var.vpc_cidr
  environment = var.environment
}

module "elb" {
  source      = "git::https://github.com/asnaga/terraform-modules.git//modules/elb?ref=main"
  vpc_id      = module.vpc.vpc_id
  subnets     = module.vpc.public_subnets
  environment = var.environment
}

module "ecs" {
  source      = "git::https://github.com/asnaga/terraform-modules.git//modules/ecs?ref=main"
  subnets     = module.vpc.public_subnets
  environment = var.environment
}

module "rds" {
  source      = "git::https://github.com/asnaga/terraform-modules.git//modules/rds?ref=main"
  vpc_id      = module.vpc.vpc_id
  subnets     = module.vpc.public_subnets
  environment = var.environment
}

module "redis" {
  source      = "git::https://github.com/asnaga/terraform-modules.git//modules/redis?ref=main"
  vpc_id      = module.vpc.vpc_id
  subnets     = module.vpc.public_subnets
  environment = var.environment
}

module "s3" {
  source      = "git::https://github.com/asnaga/terraform-modules.git//s3/modules?ref=main"
  environment = var.environment
}
