# https://cloud.google.com/iam/docs/understanding-roles#bigtable.admin
resource "google_project_iam_member" "big_table_admin" {
  project = var.project_id
  role    = "roles/bigtable.admin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#bigtable.reader
resource "google_project_iam_member" "big_table_reader" {
  project = var.project_id
  role    = "roles/bigtable.reader"

  for_each = toset(concat(
    var.project_fe_team,
    var.project_qa_team
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#bigtable.user
resource "google_project_iam_member" "big_table_user" {
  project = var.project_id
  role    = "roles/bigtable.user"

  for_each = toset(concat(
    var.project_be_team,
    var.is_dev_env ? var.project_qa_team : [],
    var.is_dev_env ? var.project_fe_team : []
  ))

  member = "user:${each.key}"
}
