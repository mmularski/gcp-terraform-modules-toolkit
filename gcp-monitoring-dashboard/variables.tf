variable "dashboard_name" {
  description = "Dashboard name that will be displayed in GCP"
}

variable "additional_charts_before" {
  type = string

  description = "JSON Widget objects that you want to attach BEFORE all of module's charts. \n Widgets structure can be found here https://cloud.google.com/monitoring/api/ref_v3/rest/v1/projects.dashboards#widget \n \n Example \n\n additional_charts_before = jsonencode({ \"text\" : { \n    \"content\" : \"BEFORE TEST TEXT WIDGET\", \n     \"format\" : \"RAW\" \n} })"

  default = ""
}


variable "additional_charts_after" {
  type = string

  description = "JSON Widget objects that you want to attach AFTER all of module's charts. \n Widgets structure can be found here https://cloud.google.com/monitoring/api/ref_v3/rest/v1/projects.dashboards#widget \n \n Example \n\n additional_charts_after = jsonencode({ \"text\" : { \n    \"content\" : \"AFTER TEST TEXT WIDGET\", \n     \"format\" : \"RAW\" \n} })"

  default = ""
}

variable "dashboard_type" {
  type        = string
  description = "Type of the GCP service to use to provision a dashboard for. For instance, 'cloud-function' will deploy dashboard for cloud functions"

  validation {
    condition     = contains(["cloud-function", "cloud-run", "compute-engine", "app-engine"], var.dashboard_type)
    error_message = "Allowed values for dashboard_type are ${jsonencode(["cloud-function", "cloud-run", "compute-engine", "app-engine"])}."
  }
}
