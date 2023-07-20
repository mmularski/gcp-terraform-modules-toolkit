# https://cloud.google.com/iam/docs/understanding-roles#run.admin
resource "google_project_iam_member" "cloud_run_admin" {
  project = var.project_id
  role    = "roles/run.admin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#run.invoker
resource "google_project_iam_member" "cloud_run_invoker" {
  project = var.project_id
  role    = "roles/run.invoker"

  for_each = toset(concat(
    var.project_lead_team,
    var.project_be_team,
    var.project_fe_team,
    var.project_qa_team,
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#run.viewer
resource "google_project_iam_member" "cloud_run_viewer" {
  project = var.project_id
  role    = "roles/run.viewer"

  for_each = toset(concat(
    var.project_lead_team,
    var.project_be_team,
    var.project_fe_team,
    var.project_qa_team,
  ))

  member = "user:${each.key}"
}
