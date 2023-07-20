# https://cloud.google.com/iam/docs/understanding-roles#bigquery.admin
resource "google_project_iam_member" "big_query_admin" {
  project = var.project_id
  role    = "roles/bigquery.admin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#bigquery.dataViewer
resource "google_project_iam_member" "big_query_data_viewer" {
  project = var.project_id
  role    = "roles/bigquery.dataViewer"

  for_each = toset(concat(
    var.project_be_team,
    var.project_fe_team,
    var.project_qa_team
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#bigquery.jobUser
resource "google_project_iam_member" "big_query_job_user" {
  project = var.project_id
  role    = "roles/bigquery.user"

  for_each = toset(concat(
    var.is_dev_env ? var.project_be_team : [],
    var.is_dev_env ? var.project_qa_team : [],
    var.is_dev_env ? var.project_fe_team : []
  ))

  member = "user:${each.key}"
}
