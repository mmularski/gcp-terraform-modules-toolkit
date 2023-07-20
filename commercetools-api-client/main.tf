resource "commercetools_api_client" "api_client" {
  name  = var.api_client_name
  scope = split(" ", var.api_client_scopes)
}
