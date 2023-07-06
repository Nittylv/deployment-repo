module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name            = var.name
  cidr            = var.cidr
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets



  azs = ["us-east-1a", "us-east-1b", "us-east-1c"]


  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = var.tags
}