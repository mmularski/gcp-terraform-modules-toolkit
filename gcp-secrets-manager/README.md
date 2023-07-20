# gcp-secrets-manager

Terraform module used for storing secrets in GCP Secret Manager

---

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.7 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >=4.43.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.62.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_secret_manager_secret.secret](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret) | resource |
| [google_secret_manager_secret_version.secret_version](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_version) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Secret name | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region | `string` | n/a | yes |
| <a name="input_value"></a> [value](#input\_value) | Secret value | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_secret"></a> [secret](#output\_secret) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
