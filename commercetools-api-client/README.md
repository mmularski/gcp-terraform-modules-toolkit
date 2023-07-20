# commercetools-api-client

Terraform module for Commercetools API client creation

---

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.7 |
| <a name="requirement_commercetools"></a> [commercetools](#requirement\_commercetools) | >=1.5.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_commercetools"></a> [commercetools](#provider\_commercetools) | 1.6.9 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [commercetools_api_client.api_client](https://registry.terraform.io/providers/labd/commercetools/latest/docs/resources/api_client) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_client_name"></a> [api\_client\_name](#input\_api\_client\_name) | API client name | `string` | n/a | yes |
| <a name="input_api_client_scopes"></a> [api\_client\_scopes](#input\_api\_client\_scopes) | Scopes for the API client(delimited by space). E.g. project:view\_orders project:view\_customers | `string` | n/a | yes |
| <a name="input_projectKey"></a> [projectKey](#input\_projectKey) | Commercetools project key | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_id"></a> [client\_id](#output\_client\_id) | Commercetools API Client ID |
| <a name="output_client_secret"></a> [client\_secret](#output\_client\_secret) | Commercetools API Client Secret |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
