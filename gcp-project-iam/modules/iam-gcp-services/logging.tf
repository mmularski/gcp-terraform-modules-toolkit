# https://cloud.google.com/iam/docs/understanding-roles#logging.admin
resource "google_project_iam_member" "logging_admin" {
  project = var.project_id
  role    = "roles/logging.admin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#logging.viewer
resource "google_project_iam_member" "logging_viewer" {
  project = var.project_id
  role    = "roles/logging.viewer"

  for_each = toset(concat(
    var.project_be_team,
    var.project_qa_team,
    var.project_fe_team
  ))

  member = "user:${each.key}"
}
