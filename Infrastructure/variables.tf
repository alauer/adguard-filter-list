variable "bucket_name" {
  description = "Globally unique S3 bucket name"
  type        = string
}

variable "app_server_service" {
  description = "Service principal for AppServerRole (e.g., ec2.amazonaws.com)"
  type        = string
  default     = "ec2.amazonaws.com"
}
