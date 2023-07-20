# https://cloud.google.com/iam/docs/understanding-roles#cloudsql.admin
resource "google_project_iam_member" "cloud_sql_admin" {
  project = var.project_id
  role    = "roles/cloudsql.admin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#cloudsql.client
resource "google_project_iam_member" "cloud_sql_client" {
  project = var.project_id
  role    = "roles/cloudsql.client"

  for_each = toset(concat(
    var.project_be_team,
    var.project_fe_team,
    var.project_qa_team
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#cloudsql.editor
resource "google_project_iam_member" "cloud_sql_editor" {
  project = var.project_id
  role    = "roles/cloudsql.editor"

  for_each = toset(concat(
    var.project_be_team,
    var.is_dev_env ? var.project_qa_team : [],
    var.is_dev_env ? var.project_fe_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#cloudsql.instanceUser
resource "google_project_iam_member" "cloud_sql_instance_user" {
  project = var.project_id
  role    = "roles/cloudsql.instanceUser"

  for_each = toset(concat(
    var.project_be_team,
    var.project_fe_team,
    var.project_qa_team
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#cloudsql.viewer
resource "google_project_iam_member" "cloud_sql_viewer" {
  project = var.project_id
  role    = "roles/cloudsql.viewer"

  for_each = toset(concat(
    var.project_fe_team,
    var.project_qa_team
  ))

  member = "user:${each.key}"
}
