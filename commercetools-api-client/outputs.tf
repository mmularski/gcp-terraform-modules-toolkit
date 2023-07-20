output "client_id" {
  value       = commercetools_api_client.api_client.id
  description = "Commercetools API Client ID"
  sensitive   = true
}

output "client_secret" {
  value       = commercetools_api_client.api_client.secret
  description = "Commercetools API Client Secret"
  sensitive   = true
}
