variable "name" {
  type        = string
  description = "Secret name"
}

variable "value" {
  type        = string
  description = "Secret value"
  sensitive   = true
}

variable "region" {
  type        = string
  description = "Region"
}
