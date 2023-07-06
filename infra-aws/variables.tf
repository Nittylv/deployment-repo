######################
# # VPC
######################

variable "name" {
  type        = string
  description = "for the vpc naming"
}

variable "cidr" {
  type        = string
  description = "VPC CIDR"
}

variable "private_subnets" {
  type        = list(any)
  description = "list of private subnets in vpc"
}

variable "public_subnets" {
  type        = list(any)
  description = "list of private subnets in vpc"
}


variable "tags" {
  type        = map(string)
  description = "Tags for resources"
}

######################
## SECURITY GROUP
#########################

variable "security_groups" {
  type        = any
  description = "Security groups configuration"
  sensitive   = false
}


##########################
## ECR
#####################

variable "ecr_repos" {
  type        = map(any)
  description = "List of ECR repos and configs, see example in default"
}

################
# EKS variables
################

variable "cluster_name" {
  type = string
}


variable "cluster_version" {
  type = string
}

variable "cluster_endpoint_private_access" {
  type    = bool
  default = true
}

variable "cluster_endpoint_public_access" {
  type    = bool
  default = true
}

variable "namespaces" {
  type        = list(string)
  description = "Kubernetes namespaces to create"
  default     = []
}

variable "eks_managed_node_groups" {
  type = map(any)
}

variable "manage_aws_auth_configmap" {
  type    = bool
  default = true
}





