
module "eks" {
  source       = "terraform-aws-modules/eks/aws"
  cluster_name = "${var.ENV}-cluster"
  subnets      = var.PRIVATE_SUBNETS

  tags = {
    Name        = "${var.ENV}-cluster"
    Environment = var.ENV
  }

  vpc_id = var.VPC_ID

  worker_groups = [
    {
      name                          = "${var.ENV}-worker-group-1"
      instance_type                 = "t2.micro"
      ami                           = var.AMIS[var.AWS_REGION]
      additional_userdata           = "echo foo bar"
      asg_desired_capacity          = 2
      asg_max_size                  = 5
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
    }
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
