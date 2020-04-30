module "main-vpc" {
  source     = "../modules/vpc"
  ENV        = "dev"
  AWS_REGION = var.AWS_REGION
}

module "jenkins" {
  source         = "../modules/jenkins-instance"
  ENV            = "dev"
  AWS_REGION     = var.AWS_REGION
  KEY_NAME       = "mykeypair-${var.ENV}"
  VPC_ID         = module.main-vpc.vpc_id
  PUBLIC_SUBNETS = module.main-vpc.public_subnets
}
