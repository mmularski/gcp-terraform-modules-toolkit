# https://cloud.google.com/iam/docs/understanding-roles#secretmanager.admin
resource "google_project_iam_member" "secret_manager_admin" {
  project = var.project_id
  role    = "roles/secretmanager.admin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#secretmanager.secretAccessor
resource "google_project_iam_member" "secret_manager_accessor" {
  project = var.project_id
  role    = "roles/secretmanager.secretAccessor"

  for_each = toset(concat(
    var.project_be_team,
    var.project_fe_team,
    var.project_qa_team
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#secretmanager.secretVersionManager
resource "google_project_iam_member" "secret_manager_version_manager" {
  project = var.project_id
  role    = "roles/secretmanager.secretVersionManager"

  for_each = toset(var.project_be_team)

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#secretmanager.viewer
resource "google_project_iam_member" "secret_manager_viewer" {
  project = var.project_id
  role    = "roles/secretmanager.viewer"

  for_each = toset(concat(
    var.project_be_team,
    var.project_fe_team,
    var.project_qa_team
  ))

  member = "user:${each.key}"
}
