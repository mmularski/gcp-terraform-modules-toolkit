# https://cloud.google.com/iam/docs/understanding-roles#firebase.admin
resource "google_project_iam_member" "firebase_admin" {
  project = var.project_id
  role    = "roles/firebase.admin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#firebase.viewer
resource "google_project_iam_member" "firebase_viewer" {
  project = var.project_id
  role    = "roles/firebase.viewer"

  for_each = toset(concat(
    var.project_be_team,
    var.project_fe_team,
    var.project_qa_team
  ))

  member = "user:${each.key}"
}
