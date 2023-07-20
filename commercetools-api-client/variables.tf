variable "projectKey" {
  type        = string
  description = "Commercetools project key"
}

variable "api_client_name" {
  type        = string
  description = "API client name"
}

variable "api_client_scopes" {
  type        = string
  description = "Scopes for the API client(delimited by space). E.g. project:view_orders project:view_customers"
}
