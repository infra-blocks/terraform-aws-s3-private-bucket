variable "namespace" {
  type        = string
  description = <<EOT
The bucket namespace. Valid values are "account-regional" or "global".
When omitted, AWS defaults to "global".
EOT
  default     = null
}

variable "name" {
  type        = string
  description = "The name of the bucket."
}

variable "default_encryption_kms_key_arn" {
  type        = string
  description = "The default encryption KMS key to use. If none is provided, it defaults to the AES256 encryption algorithm"
  default     = null
}

variable "enable_versioning" {
  type        = bool
  description = "Whether to enable versioning. Defaults to false."
  default     = false
}

variable "policy" {
  type        = string
  description = "The optional bucket policy."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "The set of tags to apply to provided resources"
  default     = {}
}
