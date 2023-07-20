# https://cloud.google.com/iam/docs/understanding-roles#storage.admin
resource "google_project_iam_member" "cloud_storage_admin" {
  project = var.project_id
  role    = "roles/storage.admin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#storage.hmacKeyAdmin
resource "google_project_iam_member" "cloud_storage_hmac_admin" {
  project = var.project_id
  role    = "roles/storage.hmacKeyAdmin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#storage.objectAdmin
resource "google_project_iam_member" "cloud_storage_object_admin" {
  project = var.project_id
  role    = "roles/storage.objectAdmin"

  for_each = toset(concat(
    var.project_lead_team,
    var.project_be_team
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#storage.objectCreator
resource "google_project_iam_member" "cloud_storage_object_creator" {
  project = var.project_id
  role    = "roles/storage.objectAdmin"

  for_each = toset(concat(
    var.project_fe_team,
    var.project_qa_team
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#storage.objectViewer
resource "google_project_iam_member" "cloud_storage_object_viewer" {
  project = var.project_id
  role    = "roles/storage.objectViewer"

  for_each = toset(concat(
    var.project_fe_team,
    var.project_qa_team
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#storagetransfer.admin
resource "google_project_iam_member" "cloud_storage_transfer_admin" {
  project = var.project_id
  role    = "roles/storagetransfer.admin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#storagetransfer.viewer
resource "google_project_iam_member" "cloud_storage_transfer_viewer" {
  project = var.project_id
  role    = "roles/storagetransfer.viewer"

  for_each = toset(concat(
    var.project_be_team,
    var.project_fe_team,
    var.project_qa_team
  ))

  member = "user:${each.key}"
}
