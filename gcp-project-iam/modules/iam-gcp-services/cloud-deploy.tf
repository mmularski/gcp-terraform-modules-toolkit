# https://cloud.google.com/iam/docs/understanding-roles#clouddeploy.admin
resource "google_project_iam_member" "cloud_deploy_admin" {
  project = var.project_id
  role    = "roles/clouddeploy.admin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#clouddeploy.approver
resource "google_project_iam_member" "cloud_deploy_approver" {
  project = var.project_id
  role    = "roles/clouddeploy.approver"

  for_each = toset(concat(
    var.project_lead_team,
    var.project_be_team
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#clouddeploy.developer
resource "google_project_iam_member" "cloud_deploy_developer" {
  project = var.project_id
  role    = "roles/clouddeploy.developer"

  for_each = toset(var.is_dev_env ? var.project_be_team : [])

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#clouddeploy.jobRunner
resource "google_project_iam_member" "cloud_deploy_runner" {
  project = var.project_id
  role    = "roles/clouddeploy.jobRunner"

  for_each = toset(var.project_be_team)

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#clouddeploy.operator
resource "google_project_iam_member" "cloud_deploy_operator" {
  project = var.project_id
  role    = "roles/clouddeploy.operator"

  for_each = toset(var.is_dev_env ? var.project_be_team : [])

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#clouddeploy.releaser
resource "google_project_iam_member" "cloud_deploy_releaser" {
  project = var.project_id
  role    = "roles/clouddeploy.releaser"

  for_each = toset(var.is_dev_env ? var.project_be_team : [])

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#clouddeploy.viewer
resource "google_project_iam_member" "cloud_deploy_viewer" {
  project = var.project_id
  role    = "roles/clouddeploy.viewer"

  for_each = toset(concat(
    var.project_be_team,
    var.project_fe_team,
    var.project_qa_team
  ))

  member = "user:${each.key}"
}
