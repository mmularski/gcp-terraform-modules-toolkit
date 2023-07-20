# https://cloud.google.com/iam/docs/understanding-roles#cloudscheduler.admin
resource "google_project_iam_member" "cloud_scheduler_admin" {
  project = var.project_id
  role    = "roles/cloudscheduler.admin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#cloudscheduler.jobRunner
resource "google_project_iam_member" "cloud_scheduler_job_runner" {
  project = var.project_id
  role    = "roles/cloudscheduler.jobRunner"

  for_each = toset(concat(
    var.project_be_team,
    var.project_fe_team,
    var.project_qa_team,
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#cloudscheduler.viewer
resource "google_project_iam_member" "cloud_scheduler_viewer" {
  project = var.project_id
  role    = "roles/cloudscheduler.viewer"

  for_each = toset(concat(
    var.project_be_team,
    var.project_fe_team,
    var.project_qa_team,
  ))

  member = "user:${each.key}"
}
