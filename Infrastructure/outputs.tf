output "s3_bucket_name" {
  description = "Name of the private S3 bucket"
  value       = aws_s3_bucket.private_bucket.bucket
}

output "cloudfront_distribution_domain" {
  description = "CloudFront distribution domain name"
  value       = aws_cloudfront_distribution.cdn.domain_name
}

output "cloudfront_distribution_url" {
  description = "Full HTTPS URL for the CloudFront distribution"
  value       = "https://${aws_cloudfront_distribution.cdn.domain_name}"
}

output "kms_key_arn" {
  description = "ARN of the KMS key used for bucket encryption"
  value       = aws_kms_key.s3_key.arn
}

output "kms_key_id" {
  description = "Key ID of the KMS key used for bucket encryption"
  value       = aws_kms_key.s3_key.key_id
}

output "kms_key_alias" {
  description = "Alias name of the KMS key"
  value       = aws_kms_alias.s3_key_alias.name
}
