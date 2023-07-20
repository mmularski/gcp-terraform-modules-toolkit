# https://cloud.google.com/iam/docs/understanding-roles#eventarc.admin
resource "google_project_iam_member" "eventarc_admin" {
  project = var.project_id
  role    = "roles/eventarc.admin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#eventarc.developer
resource "google_project_iam_member" "eventarc_developer" {
  project = var.project_id
  role    = "roles/eventarc.developer"

  for_each = toset(var.project_be_team)

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#eventarc.publisher
resource "google_project_iam_member" "eventarc_publisher" {
  project = var.project_id
  role    = "roles/eventarc.publisher"

  for_each = toset(concat(
    var.project_fe_team,
    var.project_qa_team
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#eventarc.viewer
resource "google_project_iam_member" "eventarc_viewer" {
  project = var.project_id
  role    = "roles/eventarc.viewer"

  for_each = toset(concat(
    var.project_fe_team,
    var.project_qa_team
  ))

  member = "user:${each.key}"
}
