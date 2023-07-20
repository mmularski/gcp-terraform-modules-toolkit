# https://cloud.google.com/iam/docs/understanding-roles#cloudprofiler.agent
resource "google_project_iam_member" "cloud_profiler_agent" {
  project = var.project_id
  role    = "roles/cloudprofiler.agent"

  for_each = toset(concat(
    var.project_lead_team,
    var.project_be_team
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#cloudprofiler.user
resource "google_project_iam_member" "cloud_profiler_user" {
  project = var.project_id
  role    = "roles/cloudprofiler.user"

  for_each = toset(concat(
    var.project_lead_team,
    var.project_be_team
  ))

  member = "user:${each.key}"
}
