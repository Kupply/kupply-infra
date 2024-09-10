# EC2 Outputs
output "ec2_instance_id" {
  value = aws_instance.my_ec2_instance.id
  description = "The ID of the EC2 instance"
}

output "ec2_public_ip" {
  value = aws_instance.my_ec2_instance.public_ip
  description = "The public IP of the EC2 instance"
}

# S3 Outputs
output "s3_bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
  description = "The name of the S3 bucket"
}
