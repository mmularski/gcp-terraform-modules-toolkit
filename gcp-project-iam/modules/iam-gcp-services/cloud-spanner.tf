# https://cloud.google.com/iam/docs/understanding-roles#spanner.admin
resource "google_project_iam_member" "cloud_spanner_admin" {
  project = var.project_id
  role    = "roles/spanner.admin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#spanner.backupWriter
resource "google_project_iam_member" "cloud_spanner_backup_writer" {
  project = var.project_id
  role    = "roles/spanner.backupWriter"

  for_each = toset(var.project_be_team)

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#spanner.databaseReader
resource "google_project_iam_member" "cloud_spanner_db_reader" {
  project = var.project_id
  role    = "roles/spanner.databaseReader"

  for_each = toset(concat(
    var.project_fe_team,
    var.project_qa_team
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#spanner.databaseUser
resource "google_project_iam_member" "cloud_spanner_db_user" {
  project = var.project_id
  role    = "roles/spanner.databaseUser"

  for_each = toset(concat(
    var.project_be_team,
    var.is_dev_env ? var.project_qa_team : [],
    var.is_dev_env ? var.project_fe_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#spanner.viewer
resource "google_project_iam_member" "cloud_spanner_viewer" {
  project = var.project_id
  role    = "roles/spanner.databaseReader"

  for_each = toset(concat(
    var.project_be_team,
    var.project_fe_team,
    var.project_qa_team
  ))

  member = "user:${each.key}"
}
