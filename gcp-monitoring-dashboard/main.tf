resource "google_monitoring_dashboard" "dashboard" {
  dashboard_json = templatefile(
    "${path.module}/dashboards/gcp-${var.dashboard_type}.tftpl",
    {
      tf_display_name             = var.dashboard_name
      tf_additional_charts_before = var.additional_charts_before != "" ? "${var.additional_charts_before}," : ""
      tf_additional_charts_after  = var.additional_charts_after != "" ? ",${var.additional_charts_after}" : ""
    }
  )
}
