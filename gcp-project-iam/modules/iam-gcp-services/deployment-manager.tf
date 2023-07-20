# https://cloud.google.com/iam/docs/understanding-roles#deploymentmanager.editor
resource "google_project_iam_member" "deployment_manager_editor" {
  project = var.project_id
  role    = "roles/deploymentmanager.editor"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#deploymentmanager.viewer
resource "google_project_iam_member" "deployment_manager_viewer" {
  project = var.project_id
  role    = "roles/deploymentmanager.viewer"

  for_each = toset(concat(
    var.project_be_team,
    var.project_fe_team,
    var.project_qa_team
  ))

  member = "user:${each.key}"
}
