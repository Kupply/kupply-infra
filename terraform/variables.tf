variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "ap-northeast-2"
}

variable "ami" {
  description = "The Amazon Machine Image (AMI) ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}
