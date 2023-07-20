# https://cloud.google.com/iam/docs/understanding-roles#cloudtrace.admin
resource "google_project_iam_member" "cloud_trace_admin" {
  project = var.project_id
  role    = "roles/cloudtrace.admin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#cloudtrace.user
resource "google_project_iam_member" "cloud_trace_user" {
  project = var.project_id
  role    = "roles/cloudtrace.user"

  for_each = toset(var.project_be_team)

  member = "user:${each.key}"
}
