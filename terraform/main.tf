AWS Infrastructure Provisioning

provider "aws" { region = "us-east-1" }

resource "aws_vpc" "main_vpc" { cidr_block = "10.0.0.0/16" enable_dns_hostnames = true tags = { Name = "Staqlt-Production-VPC" } }

resource "aws_eks_cluster" "eks_cluster" { name = "staqlt-eks-prod" role_arn = aws_iam_role.eks_cluster_role.arn

vpc_config { subnet_ids = aws_subnet.public_subnets[*].id } }

resource "aws_s3_bucket" "artifacts" { bucket = "staqlt-build-artifacts-prod" acl = "private"

versioning { enabled = true } }