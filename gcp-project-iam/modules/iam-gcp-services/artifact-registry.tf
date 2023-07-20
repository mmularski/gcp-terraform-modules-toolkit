# https://cloud.google.com/iam/docs/understanding-roles#artifactregistry.admin
resource "google_project_iam_member" "artifact_registry_admin" {
  project = var.project_id
  role    = "roles/artifactregistry.admin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#artifactregistry.reader
resource "google_project_iam_member" "artifact_registry_reader" {
  project = var.project_id
  role    = "roles/artifactregistry.reader"

  for_each = toset(concat(
    var.project_fe_team,
    var.project_qa_team
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#artifactregistry.writer
resource "google_project_iam_member" "artifact_registry_writer" {
  project = var.project_id
  role    = "roles/artifactregistry.writer"

  for_each = toset(var.project_be_team)

  member = "user:${each.key}"
}
