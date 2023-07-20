# https://cloud.google.com/iam/docs/understanding-roles#cloudbuild.builds.approver
resource "google_project_iam_member" "cloud_build_approver" {
  project = var.project_id
  role    = "roles/cloudbuild.builds.approver"

  for_each = toset(concat(
    var.project_lead_team,
    var.project_be_team
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#cloudbuild.builds.editor
resource "google_project_iam_member" "cloud_build_editor" {
  project = var.project_id
  role    = "roles/cloudbuild.builds.approver"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#cloudbuild.builds.viewer
resource "google_project_iam_member" "cloud_build_viewer" {
  project = var.project_id
  role    = "roles/cloudbuild.builds.viewer"

  for_each = toset(concat(
    var.project_be_team,
    var.project_fe_team,
    var.project_qa_team
  ))

  member = "user:${each.key}"
}
