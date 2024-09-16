variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
}

variable "ami" {
  description = "The Amazon Machine Image (AMI) ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
}

variable "subnet_az" {
  description = "The availability zone for the subnet"
  type        = string
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "backend_bucket_name" {
  description = "The name of the S3 bucket for terraform backend"
  type        = string
}

variable "backend_table_name" {
  description = "The name of the DynamoDB table for terraform backend"
  type        = string
}