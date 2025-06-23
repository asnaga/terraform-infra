provider "aws" { region = var.region }

module "vpc" {
  source      = "git::https://github.com/asnaga/terraform-modules.git//VPC?ref=main"
  vpc_cidr    = var.vpc_cidr
  environment = var.environment
}

module "elb" {
  source      = "git::https://github.com/asnaga/terraform-modules.git//elb?ref=main"
  vpc_id      = module.vpc.vpc_id
  subnets     = module.vpc.public_subnets
  environment = var.environment
}

module "ecs" {
  source      = "git::https://github.com/asnaga/terraform-modules.git//ecs?ref=main"
  subnets     = module.vpc.public_subnets
  environment = var.environment
}

module "rds" {
  source      = "git::https://github.com/asnaga/terraform-modules.git//rds?ref=main"
  vpc_id      = module.vpc.vpc_id
  subnets     = module.vpc.public_subnets
  environment = var.environment
}

module "redis" {
  source      = "git::https://github.com/asnaga/terraform-modules.git//redis?ref=main"
  vpc_id      = module.vpc.vpc_id
  subnets     = module.vpc.public_subnets
  environment = var.environment
}

module "s3" {
  source      = "git::https://github.com/asnaga/terraform-modules.git//S3?ref=main"
  environment = var.environment
}
