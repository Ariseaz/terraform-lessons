module "vpc" {
  source     = "../modules/vpc"
  ENV        = "dev"
  AWS_REGION = var.AWS_REGION
}

module "eks" {
  source     = "../modules/eks"
  ENV            = "dev"
  VPC_ID         = module.vpc.vpc_id
  PRIVATE_SUBNETS = module.vpc.private_subnets
  AWS_REGION = var.AWS_REGION
}