# https://cloud.google.com/iam/docs/understanding-roles#file.editor
resource "google_project_iam_member" "cloud_filestore_editor" {
  project = var.project_id
  role    = "roles/file.editor"

  for_each = toset(concat(
    var.project_lead_team,
    var.project_be_team,
    var.is_dev_env ? var.project_qa_team : [],
    var.is_dev_env ? var.project_fe_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#file.viewer
resource "google_project_iam_member" "cloud_filestore_viewer" {
  project = var.project_id
  role    = "roles/file.viewer"

  for_each = toset(concat(
    var.project_qa_team,
    var.project_fe_team
  ))

  member = "user:${each.key}"
}
