
# gcp-monitoring-dashboard

Terraform module with predefined dashboards(using the Google recommended way) for various GCP products using Google Cloud [Dashboard API](https://cloud.google.com/monitoring/api/ref_v3/rest/v1/projects.dashboards#resource:-dashboard)

**Table of contents:**

* [Available Dashboards](#available-dashboards)
  * [Cloud Function](#cloud-function)
  * [Compute Engine](#compute-engine)
  * [App Engine](#app-engine)
  * [Cloud Run](#cloud-run)
* [Terraform docs](#terraform-docs)

---

## Available dashboards

### Cloud Function
This dashboard has 5 charts for the related [Cloud Functions metrics](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-cloudfunctions), including `Active instances`, `Execution count`, `Execution times`, `Network egress`, and `Memory usage`.

##### Terraform
```hcl
module "cloud-function-monitoring-dashboard" {
  source = "git@github.com:mmularski/gcp-terraform-modules-toolkit.git//gcp-monitoring-dashboard"

  dashboard_name = "Cloud Functions Monitoring Dashboard"
  dashboard_type = "cloud-function"
}
```

---

### Compute Engine
This dashboard has 10 charts for the related [GCE VM metrics](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-compute), including metrics for CPU, disk read/write, and network.

##### Terraform
```hcl
module "compute-engine-monitoring-dashboard" {
  source = "git@github.com:mmularski/gcp-terraform-modules-toolkit.git//gcp-monitoring-dashboard"

  dashboard_name = "Compute Engine VMs Monitoring Dashboard"
  dashboard_type = "compute-engine"
}
```

---

### App Engine Standard
This dashboard has 7 charts for the related [Google App Engine Standard Environment metrics](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-appengine), including metrics for HTTP server area, CPU, memory, and network.
##### Terraform

```hcl
module "app-engine-monitoring-dashboard" {
  source = "git@github.com:mmularski/gcp-terraform-modules-toolkit.git//gcp-monitoring-dashboard"

  dashboard_name = "App Engine Standard Monitoring Dashboard"
  dashboard_type = "app-engine"
}
```

---

### Cloud Run
This dashboard has 7 charts for the related [Cloud Run metrics](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-run), including `Request Count`, `Request Latency`, `Billable Instance Time`, `Container CPU Allocation`, `Container Memory Allocation`, `Container CPU Utilization`, and `Container Memory Utilization`.

##### Terraform

```hcl
module "cloud-run-monitoring-dashboard" {
  source = "git@github.com:mmularski/gcp-terraform-modules-toolkit.git//gcp-monitoring-dashboard"

  dashboard_name = "Clour Run Monitoring Dashboard"
  dashboard_type = "cloud-run"
}
```

---

## Terraform docs
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.43, < 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 4.43, < 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_monitoring_dashboard.dashboard](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_dashboard) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_charts_after"></a> [additional\_charts\_after](#input\_additional\_charts\_after) | JSON Widget objects that you want to attach AFTER all of module's charts. <br> Widgets structure can be found here https://cloud.google.com/monitoring/api/ref_v3/rest/v1/projects.dashboards#widget <br> <br> Example <br><br> additional\_charts\_after = jsonencode({ "text" : { <br>    "content" : "AFTER TEST TEXT WIDGET", <br>     "format" : "RAW" <br>} }) | `string` | `""` | no |
| <a name="input_additional_charts_before"></a> [additional\_charts\_before](#input\_additional\_charts\_before) | JSON Widget objects that you want to attach BEFORE all of module's charts. <br> Widgets structure can be found here https://cloud.google.com/monitoring/api/ref_v3/rest/v1/projects.dashboards#widget <br> <br> Example <br><br> additional\_charts\_before = jsonencode({ "text" : { <br>    "content" : "BEFORE TEST TEXT WIDGET", <br>     "format" : "RAW" <br>} }) | `string` | `""` | no |
| <a name="input_dashboard_name"></a> [dashboard\_name](#input\_dashboard\_name) | Dashboard name that will be displayed in GCP | `any` | n/a | yes |
| <a name="input_dashboard_type"></a> [dashboard\_type](#input\_dashboard\_type) | Type of the GCP service to use to provision a dashboard for. For instance, 'cloud-function' will deploy dashboard for cloud functions | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

---
