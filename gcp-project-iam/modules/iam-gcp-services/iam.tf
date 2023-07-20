# https://cloud.google.com/iam/docs/understanding-roles#iam.securityAdmin
resource "google_project_iam_member" "iam_security_admin" {
  project = var.project_id
  role    = "roles/iam.securityAdmin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#resourcemanager.projectIamAdmin
resource "google_project_iam_member" "project_iam_admin" {
  project = var.project_id
  role    = "roles/resourcemanager.projectIamAdmin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#iam.securityReviewer
resource "google_project_iam_member" "iam_security_reviewer" {
  project = var.project_id
  role    = "roles/iam.securityReviewer"

  for_each = toset(var.project_be_team)

  member = "user:${each.key}"
}
