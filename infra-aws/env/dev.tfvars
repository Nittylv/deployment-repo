###############
## vpc
#################
name            = "Demo-VPC"
cidr            = "10.0.0.0/16"
private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

tags = {
  Terraform   = "true"
  Environment = "dev"
}


################
# EKS variables
################
cluster_version = "1.27"
cluster_name = "dev"

cluster_endpoint_private_access = true
cluster_endpoint_public_access  = true
namespaces                      = ["tooling", "dev"]
manage_aws_auth_configmap = true

eks_managed_node_groups = {
  one = {
      name = "dev-ng-one"
      instance_types = ["t3.medium"]
      capacity_type  = "ON_DEMAND"
      min_size     = 1
      max_size     = 3
      desired_size = 2
      force_update_version = true
    }

  two = {
      name = "dev-ng-two"
      instance_types = ["t3.medium"]
      capacity_type  = "SPOT"
      min_size     = 1
      max_size     = 3
      desired_size = 2
      force_update_version = true
    }
}

###################
## SECURITY-GROUP
###################
security_groups = {
    eks_worker_node = {
    name        = "dev-eks-workers"
    description = "EKS worker node security group"
    create      = true
    security_group_id = ""
    ingress_cidr_blocks      = ["10.0.0.0/16"]
    egress_cidr_blocks       = ["10.0.0.0/16"]
    ingress_rules            = [/*"http-80-tcp",*/]
    egress_rules             = [/*"http-80-tcp",*/]
    ingress_with_cidr_blocks = [
      {
        from_port   = 8080
        to_port     = 8084
        protocol    = "tcp"
        description = "open port range 8080-8084/tcp ingress rule"
        cidr_blocks = "10.0.0.0/16"
      },
    ]
    egress_with_cidr_blocks = [
      {
        from_port   = 8080
        to_port     = 8084
        protocol    = "tcp"
        description = "open port range 8080-8084/tcp egress rule"
        cidr_blocks = "10.0.0.0/16"
      },
    ]
  }
}


ecr_repos = {
  "test-repo" = {
    name = "test_repo"
    tags = {
      name        = "test_repo"
      Description = "test repo"
      Environment = "dev"
    }
  }
}