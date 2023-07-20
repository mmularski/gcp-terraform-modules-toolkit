# https://cloud.google.com/iam/docs/understanding-roles#iam.serviceAccountAdmin
resource "google_project_iam_member" "service_account_admin" {
  project = var.project_id
  role    = "roles/iam.serviceAccountAdmin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#iam.serviceAccountTokenCreator
resource "google_project_iam_member" "service_account_token_creator" {
  project = var.project_id
  role    = "roles/iam.serviceAccountTokenCreator"

  for_each = toset(var.project_be_team)

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#iam.serviceAccountUser
resource "google_project_iam_member" "service_account_user" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"

  for_each = toset(var.project_be_team)

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#iam.workloadIdentityUser
resource "google_project_iam_member" "service_account_workload_identity_user" {
  project = var.project_id
  role    = "roles/iam.workloadIdentityUser"

  for_each = toset(var.project_be_team)

  member = "user:${each.key}"
}
