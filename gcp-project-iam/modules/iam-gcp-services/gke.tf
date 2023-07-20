# https://cloud.google.com/iam/docs/understanding-roles#container.admin
resource "google_project_iam_member" "gke_admin" {
  project = var.project_id
  role    = "roles/container.admin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#container.developer
resource "google_project_iam_member" "gke_developer" {
  project = var.project_id
  role    = "roles/container.developer"

  for_each = toset(var.project_be_team)

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#container.viewer
resource "google_project_iam_member" "gke_viewer" {
  project = var.project_id
  role    = "roles/container.viewer"

  for_each = toset(concat(
    var.project_qa_team,
    var.project_fe_team
  ))

  member = "user:${each.key}"
}
