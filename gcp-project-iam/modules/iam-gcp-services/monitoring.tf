# https://cloud.google.com/iam/docs/understanding-roles#monitoring.admin
resource "google_project_iam_member" "monitoring_admin" {
  project = var.project_id
  role    = "roles/monitoring.admin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#monitoring.editor
resource "google_project_iam_member" "monitoring_editor" {
  project = var.project_id
  role    = "roles/monitoring.editor"

  for_each = toset(var.project_be_team)

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#monitoring.viewer
resource "google_project_iam_member" "monitoring_viewer" {
  project = var.project_id
  role    = "roles/monitoring.viewer"

  for_each = toset(concat(
    var.project_fe_team,
    var.project_qa_team
  ))

  member = "user:${each.key}"
}
