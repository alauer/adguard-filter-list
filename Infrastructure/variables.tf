variable "bucket_name" {
  description = "Globally unique S3 bucket name"
  type        = string
}

variable "allow_account_root_admin" {
  description = "Whether to allow account root as a key admin"
  type        = bool
  default     = true
}

variable "trusted_admin_principal" {
  description = "Principal allowed to assume TerraformAdmin role"
  type        = string
}

variable "app_server_service" {
  description = "Service principal for AppServerRole (e.g., ec2.amazonaws.com)"
  type        = string
  default     = "ec2.amazonaws.com"
}
