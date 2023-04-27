provider "aws" {
  region  = "ap-south-1" # Don't change the region
}
/* 
# Add your S3 backend configuration here
terraform {
  backend "s3" {
    bucket = "3.devops.candidate.exam"
    region  = "ap-south-1"
    key     = "Elyahu.Eaton"
  }
}


# From ChaGPT

resource "aws_subnet" "excerPrivateSubNet" {
  vpc_id = data.vc.id
  cidr_block = "10.0.${var.subnet_number}.0/24"
  
  # other subnet configuration options go here
}
 */