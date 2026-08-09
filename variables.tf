variable "name" {
  type        = string
  description = "The name of the bucket."
}

variable "default_encryption_kms_key_id" {
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
