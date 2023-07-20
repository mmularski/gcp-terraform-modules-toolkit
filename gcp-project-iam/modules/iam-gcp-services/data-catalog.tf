# https://cloud.google.com/iam/docs/understanding-roles#datacatalog.admin
resource "google_project_iam_member" "data_catalog_admin" {
  project = var.project_id
  role    = "roles/datacatalog.admin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#datacatalog.entryGroupOwner
resource "google_project_iam_member" "data_catalog_entry_group_owner" {
  project = var.project_id
  role    = "roles/datacatalog.entryGroupOwner"

  for_each = toset(concat(
    var.project_lead_team,
    var.project_be_team
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#datacatalog.entryOwner
resource "google_project_iam_member" "data_catalog_entry_owner" {
  project = var.project_id
  role    = "roles/datacatalog.entryOwner"

  for_each = toset(concat(
    var.project_lead_team,
    var.project_be_team
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#datacatalog.viewer
resource "google_project_iam_member" "data_catalog_viewer" {
  project = var.project_id
  role    = "roles/datacatalog.viewer"

  for_each = toset(concat(
    var.project_be_team,
    var.project_fe_team,
    var.project_qa_team
  ))

  member = "user:${each.key}"
}
