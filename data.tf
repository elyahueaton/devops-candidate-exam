data "aws_nat_gateway" "nat" {
  id = "nat-04bad8be564a37c70"
}

data "aws_vpc" "vpc" {
  id = "vpc-00bf0d10a6a41600c"
}

data "aws_iam_role" "lambda" {
  name = "DevOps-Candidate-Lambda-Role"
}

data "aws_s3" "s3" {
  backend = "s3"
  config = {
    bucket = "3.devops.candidate.exam"
    region  = "ap-south-1"
    key     = "Elyahu.Eaton"
  }
}