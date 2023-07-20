# https://cloud.google.com/iam/docs/understanding-roles#cloudfunctions.admin
resource "google_project_iam_member" "cloud_functions_admin" {
  project = var.project_id
  role    = "roles/cloudfunctions.admin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#cloudfunctions.developer
resource "google_project_iam_member" "cloud_functions_developer" {
  project = var.project_id
  role    = "roles/cloudfunctions.developer"

  for_each = toset(concat(
    var.project_lead_team,
    var.project_be_team
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#cloudfunctions.invoker
resource "google_project_iam_member" "cloud_functions_invoker" {
  project = var.project_id
  role    = "roles/cloudfunctions.invoker"

  for_each = toset(concat(
    var.project_qa_team,
    var.project_fe_team
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#cloudfunctions.viewer
resource "google_project_iam_member" "cloud_functions_viewer" {
  project = var.project_id
  role    = "roles/cloudfunctions.viewer"

  for_each = toset(concat(
    var.project_fe_team,
    var.project_qa_team
  ))

  member = "user:${each.key}"
}
