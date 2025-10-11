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
