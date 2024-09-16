output "ec2_instance_id" {
  value       = aws_instance.main.id
  description = "The ID of the EC2 instance"
}

output "ec2_public_ip" {
  value       = aws_instance.main.public_ip
  description = "The public IP of the EC2 instance"
}

# S3 Outputs
output "s3_bucket_name" {
  value       = aws_s3_bucket.main.bucket
  description = "The name of the S3 bucket"
}

output "s3_user_access_key" {
  value       = aws_iam_access_key.s3_user_access_key.id
  description = "Access key for the IAM user"
}

output "s3_user_secret_key" {
  value       = aws_iam_access_key.s3_user_access_key.secret
  description = "Secret access key for the IAM user"
  sensitive   = true
}
